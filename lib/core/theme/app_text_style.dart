import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';

class AppTextStyle {
  static const appBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: AppColors.white,
  );
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const ForgetPassword = TextStyle(color: Colors.black, fontSize: 17);
  static const signUpAccount = TextStyle(color: AppColors.black, fontSize: 18);
}
