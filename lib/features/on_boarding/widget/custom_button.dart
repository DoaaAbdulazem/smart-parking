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
    return ElevatedButton(onPressed: onpressed, child: Text(text));
  }
}
