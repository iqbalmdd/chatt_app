import 'package:chatt_app/components/auth_field.dart';
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
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children: [
          // all message
          Expanded(child: _buildUserList()),

          // input text
          _BuildMessageInput()
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
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(data["message"]),
          ],
        ));
  }

  // Build Message Input
  Widget _BuildMessageInput() {
    return Row(
      children: [
        Expanded(
            child: AuthField(
                hintText: "Type a message..",
                isCensored: false,
                controller: _messageController)),

        // send button
        IconButton(onPressed: sendMessage, icon: const Icon(Icons.send))
      ],
    );
  }
}
