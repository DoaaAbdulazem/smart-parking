import 'package:flutter/material.dart';
import 'package:my_project/on_boarding/widget/custom_button.dart';

class SignupBotton extends StatelessWidget {
  const SignupBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: MyCustomButtom(text: "Sign up", onpressed: () {}),
    );
  }
}
