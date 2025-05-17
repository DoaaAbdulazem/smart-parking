import 'package:flutter/material.dart';

class OneBoardingScreenTwoTittle extends StatelessWidget {
  const OneBoardingScreenTwoTittle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,

      style: TextStyle(fontSize: 20, color: Color(0xfffecb10)),
      textAlign: TextAlign.center,
    );
  }
}
