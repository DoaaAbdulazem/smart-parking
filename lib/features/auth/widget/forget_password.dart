import 'package:flutter/material.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/features/auth/screen/booking_page.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingPage()),
          );
        },
        child: Text(Strings.forgetPassword),
      ),
    );
  }
}
