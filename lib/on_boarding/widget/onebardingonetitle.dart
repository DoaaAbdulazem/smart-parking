import 'package:flutter/material.dart';

class OnebardingOneDesc extends StatelessWidget {
  const OnebardingOneDesc({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: Color(0xfffecb10), fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}
