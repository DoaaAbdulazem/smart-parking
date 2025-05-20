import 'package:flutter/material.dart';

import 'package:my_project/auth/widget/app_bar_loginscreen.dart';
import 'package:my_project/auth/widget/forget_password.dart';
import 'package:my_project/auth/widget/input_field.dart';
import 'package:my_project/auth/widget/login_botton.dart';
import 'package:my_project/auth/widget/sign_up_bottom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xff4c4f54),
      appBar: CustomAppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 50),

        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          spacing: 25,
          children: [
            SizedBox(height: 100),

            InputField(
              labeltext: "Email",
              hinttext: "Email or phone",
              prefixicon: const Icon(Icons.email),
            ),

            InputField(
              labeltext: "Password",
              hinttext: "Enter your password",
              prefixicon: const Icon(Icons.lock),
              controller: passwordController,
            ),

            ForgetPassword(),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,

              child: LoginButton(passwordController: passwordController),
            ),

            SizedBox(height: 20),

            SignUpBottom(),
          ],
        ),
      ),
    );
  }
}
