import 'package:flutter/material.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/features/home/screen/home_screen.dart';

import 'package:my_project/features/on_boarding/widget/custom_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return MyCustomButtom(
      text: Strings.login,
      onpressed: () {
        print(passwordController.text);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
    );
  }
}
