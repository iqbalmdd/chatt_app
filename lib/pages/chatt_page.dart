import 'package:flutter/material.dart';

class ChattPage extends StatelessWidget {
  final String receiverEmail;

  const ChattPage({super.key, required this.receiverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
    );
  }
}
