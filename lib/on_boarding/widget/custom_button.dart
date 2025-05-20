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
    return ElevatedButton(
      onPressed: onpressed,

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        maximumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xfffecb10),
      ),

      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 18,
        ),
      ),
    );
  }
}
