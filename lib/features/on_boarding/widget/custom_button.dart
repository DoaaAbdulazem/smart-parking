import 'package:flutter/material.dart';

class MyCustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const MyCustomButtom({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(minimumSize: Size(50, 35)),
      child: Text(text),
    );
  }
}
