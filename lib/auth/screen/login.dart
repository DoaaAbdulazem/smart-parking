import 'package:flutter/material.dart';
import 'package:my_project/auth/widget/input_field.dart';
import 'package:my_project/on_boarding/widget/custombuttom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 100),

            inputfield(
              labeltext: "Email",
              hinttext: "Email or phone",
              prefixicon: const Icon(Icons.email),
            ),

            inputfield(
              labeltext: "Password",
              hinttext: "Enter your password",
              prefixicon: const Icon(Icons.lock),
            ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: MyCustomButtom(text: "Login", onpressed: () {}),
            ),

            SizedBox(height: 200),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: MyCustomButtom(text: "Sign up", onpressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
