import 'package:flutter/material.dart';

class OneBoardingTwoImage extends StatelessWidget {
  const OneBoardingTwoImage({super.key, required this.imagepath});
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagepath,
      width: 350,
      height: 350,
      alignment: Alignment.center,
    );
  }
}
