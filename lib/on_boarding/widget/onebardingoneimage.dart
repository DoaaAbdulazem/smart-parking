import 'package:flutter/material.dart';

class OneboardingOneImage extends StatelessWidget {
  const OneboardingOneImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,

      width: 350,
      height: 350,
      alignment: Alignment.center,
    );
  }
}
