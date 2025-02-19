import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String linkImage;

  const ImageBanner({
    super.key,
    required this.linkImage
    });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.network(
        linkImage,
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: 250,
            color: Colors.grey[300],
            child: const Icon(Icons.error),
          );
        },
      ),
    );
  }
}
