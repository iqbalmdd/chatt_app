import 'package:chatt_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChattService {
  // instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiverId, message) async {
    // get current info user
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    // construct chatt room id for two users
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chattRoomId = ids.join('_');

    // add new message to database
    await _firestore
        .collection("chatt_rooms")
        .doc(chattRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // construct chatt room id for the 2 users
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chattRoomId = ids.join('_');

    return _firestore
        .collection("chatt_rooms")
        .doc(chattRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
