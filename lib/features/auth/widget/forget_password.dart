import 'package:flutter/material.dart';
import 'package:my_project/core/consts/strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(onPressed: () {}, child: Text(Strings.forgetPassword)),
    );
  }
}
