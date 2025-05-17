import 'package:flutter/material.dart';

class OneBoardingImage extends StatelessWidget {
  const OneBoardingImage({super.key, required this.imagePath});
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
