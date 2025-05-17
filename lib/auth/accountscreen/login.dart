import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Write your email ',
              hintText: 'Email',
            ),
          ),
        ],
      ),
    );
  }
}
