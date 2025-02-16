import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String name;
  final void Function()? onTap;

  const AuthButton({
    super.key,
    required this.name,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 26, 91, 143),
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}