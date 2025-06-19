import 'package:flutter/material.dart';
import 'package:my_project/core/consts/app_size.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/features/auth/screen/free_parking.dart';

import 'package:my_project/features/on_boarding/widget/custom_button.dart';

class SignupBotton extends StatelessWidget {
  const SignupBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.spaceForSignUpBotton,
      width: double.infinity,
      child: MyCustomButtom(
        text: Strings.appBarSignUpScreen,
        onpressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }
}
