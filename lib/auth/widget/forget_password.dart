import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "ForgetPassword?",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
    );
  }
}
