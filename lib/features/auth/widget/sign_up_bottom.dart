import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';
import 'package:my_project/features/auth/screen/signup.dart';

class SignUpBottom extends StatelessWidget {
  const SignUpBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()),
          );
        },
        child: const Text(
          "Dont have an account?Sign up",
          style: TextStyle(color: AppColors.black, fontSize: 18),
        ),
      ),
    );
  }
}
