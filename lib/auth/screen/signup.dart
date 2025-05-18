import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/auth/widget/input_field.dart';
import 'package:my_project/on_boarding/widget/custombuttom.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "sign up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          inputfield(
            labeltext: "First Name",
            hinttext: "first name",
            prefixicon: Icon(Icons.person),
          ),
          inputfield(
            labeltext: "Last Name",
            hinttext: "Last Name",
            prefixicon: Icon(Icons.perm_identity),
          ),
          inputfield(
            labeltext: "phone",
            hinttext: "phone",
            prefixicon: Icon(Icons.call),
          ),
          inputfield(
            labeltext: "Email",
            hinttext: "Email",
            prefixicon: Icon(Icons.email_outlined),
          ),
          inputfield(
            labeltext: "Password",
            hinttext: "Password",
            prefixicon: Icon(Icons.lock),
          ),
          inputfield(
            labeltext: "city",
            hinttext: "city",
            prefixicon: Icon(Icons.location_on),
          ),
          MyCustomButtom(text: "sign up", onpressed: () {}),
        ],
      ),
    );
  }
}
