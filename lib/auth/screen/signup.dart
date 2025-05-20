import 'package:flutter/material.dart';
import 'package:my_project/auth/widget/appbar_signup.dart';
import 'package:my_project/auth/widget/input_field.dart';
import 'package:my_project/auth/widget/signup_botton.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4c4f54),
      appBar: AppBarSignUp(),
      body: Container(
        margin: const EdgeInsets.only(top: 50),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 25,

            children: [
              const SizedBox(height: 30),
              InputField(
                labeltext: "First Name",
                hinttext: "First Name",
                prefixicon: Icon(Icons.person),
              ),
              InputField(
                labeltext: "Last Name",
                hinttext: "Last name",
                prefixicon: Icon(Icons.perm_identity),
              ),
              InputField(
                labeltext: "Phone",
                hinttext: "Phone",
                prefixicon: Icon(Icons.call),
              ),
              InputField(
                labeltext: "Email",
                hinttext: "Email",
                prefixicon: Icon(Icons.email_outlined),
              ),
              InputField(
                labeltext: "Password",
                hinttext: "Password",
                prefixicon: Icon(Icons.lock),
              ),
              InputField(
                labeltext: "City",
                hinttext: "City",
                prefixicon: Icon(Icons.location_on),
              ),
              InputField(
                labeltext: "Payment method",
                hinttext: "payment method",
                prefixicon: Icon(Icons.payment),
              ),

              SignupBotton(),
            ],
          ),
        ),
      ),
    );
  }
}
