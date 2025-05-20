import 'package:flutter/material.dart';
import 'package:my_project/on_boarding/widget/custom_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return MyCustomButtom(
      text: "Login",
      onpressed: () {
        print(passwordController.text);
      },
    );
  }
}
