import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 20 : 15,

      height: isActive ? 20 : 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isActive ? Color(0xff787b82) : Color.fromARGB(255, 225, 225, 227),
      ),
    );
  }
}
