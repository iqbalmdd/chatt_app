import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String sender;
  final void Function()? onTap;

  const UserTile({super.key, required this.sender, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            // borderRadius: BorderRadius.circular(8),
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1))
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
        child: Row(
          children: [
            // icon
            Icon(Icons.account_circle, size: 50, color: Theme.of(context).colorScheme.surface,),
            SizedBox(width: 15),
            // username
            Text(sender)
          ],
        ),
      ),
    );
  }
}
