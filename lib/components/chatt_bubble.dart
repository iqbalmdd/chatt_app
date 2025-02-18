import 'package:flutter/material.dart';

class ChattBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChattBubble({
    super.key,
    required this.message,
    required this.isCurrentUser
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isCurrentUser? const Color(0xFFD9EFF9) : const Color.fromARGB(255, 255, 255, 255)
      ),
      child: Text(message),
    );
  }
}
