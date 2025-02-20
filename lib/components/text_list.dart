import 'package:flutter/material.dart';

class TextList extends StatelessWidget {
  final List<String> text;
  final double orangeSpace;

  const TextList({Key? key, required this.text, required this.orangeSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: text.map((m) {
        return Padding(
          padding: EdgeInsets.only(bottom: orangeSpace),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Garis Kuning
                Container(
                  width: 4,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.amber,
                ),
                const SizedBox(width: 8),

                // Text
                Flexible(
                  child: Text(
                    m,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
