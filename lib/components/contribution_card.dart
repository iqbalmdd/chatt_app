import 'package:chatt_app/components/floating_card.dart';
import 'package:flutter/material.dart';

class ContributionCard extends StatelessWidget {
  final String text;

  const ContributionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: FloatingCard(
        child: InkWell(
          onTap: () => _showFullTextDialog(context, text),
          child: Text(
            text,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }

  void _showFullTextDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        content: SingleChildScrollView(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
