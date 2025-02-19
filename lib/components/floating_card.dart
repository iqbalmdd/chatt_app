import 'package:flutter/material.dart';

class FloatingCard extends StatelessWidget {
  final String title;
  final Widget child;

  const FloatingCard({super.key, this.title = "", required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1),
                right: BorderSide(color: Colors.grey, width: 1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty) ...[
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10)
            ],
            Container(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
