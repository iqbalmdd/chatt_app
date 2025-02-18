import 'package:chatt_app/components/text_field.dart';
import 'package:chatt_app/components/chatt_bubble.dart';
import 'package:chatt_app/services/auth/auth_service.dart';
import 'package:chatt_app/services/chatt/chatt_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChattPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;

  ChattPage({super.key, required this.receiverEmail, required this.receiverId});

  // Controller
  TextEditingController _messageController = TextEditingController();

  // Service
  final ChattService _chattService = ChattService();
  final AuthService _authService = AuthService();

  // Function
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // send message
      await _chattService.sendMessage(receiverId, _messageController.text);

      // clear message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          leading: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios,),
            ),
          ),
          leadingWidth: 50,
          titleSpacing: 15,
          title: Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 40,
                color: Theme.of(context).colorScheme.surface,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                receiverEmail,
                style: TextStyle(fontSize: 20),
              ),
            ],
          )),
      body: Column(
        children: [
          // all message
          Expanded(child: _buildUserList()),

          // input text
          _BuildMessageInput(context)
        ],
      ),
    );
  }

  // Build Message List
  Widget _buildUserList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chattService.getMessages(receiverId, senderId),
        builder: (context, snapshot) {
          // errors
          if (snapshot.hasError) {
            return const Text("Error");
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          // listView
          return ListView(
              children: snapshot.data!.docs
                  .map((doc) => _buildMessageItem(doc))
                  .toList());
        });
  }

  // Build Message Item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is Current User
    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    // align message to right if current user, otherwise left
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChattBubble(message: data["message"], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  // Build Message Input
  Widget _BuildMessageInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Theme.of(context).colorScheme.tertiary,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
                color: const Color.fromARGB(255, 216, 208, 208), width: 2)),
        child: Row(
          children: [
            Expanded(
                child: AuthField(
                    hintText: "Ketik Pesan disini",
                    isCensored: false,
                    controller: _messageController)),

            // send button
            IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.send,
                  color: Color.fromARGB(255, 11, 94, 162),
                ))
          ],
        ),
      ),
    );
  }
}
