import 'package:flutter/material.dart';

class MyCustomButtom extends StatelessWidget {
  const MyCustomButtom({
    super.key,
    required this.text,
    required this.onpressed,
  });

  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: const Color(0xff787b82),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xfffecb10),
          fontSize: 18,
          backgroundColor: const Color(0xff787b82),
        ),
      ),
    );
  }
}
