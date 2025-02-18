import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
        child: Row(
          children: [
            // icon
            Icon(Icons.account_circle, size: 50, color: Theme.of(context).colorScheme.tertiary,),
            SizedBox(width: 5,),
            // username
            Text(text)
          ],
        ),
      ),
    );
  }
}
