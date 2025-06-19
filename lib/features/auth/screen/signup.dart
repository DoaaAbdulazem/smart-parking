import 'package:flutter/material.dart';
import 'package:my_project/core/consts/app_size.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/core/theme/app_colors.dart';
import 'package:my_project/features/auth/widget/appbar_signup.dart';
import 'package:my_project/features/auth/widget/input_field.dart';
import 'package:my_project/features/auth/widget/signup_botton.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bkgColor,
      appBar: AppBarSignUp(),
      body: Container(
        margin: const EdgeInsets.only(top: AppSize.formContainerTopMargin),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.loginBorderRadius),
            topRight: Radius.circular(AppSize.loginBorderRadius),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: AppSize.spaceBetweenFields,

            children: [
              const SizedBox(height: AppSize.spaceAfterTitle),
              InputField(
                labeltext: Strings.labelTextFirstName,
                hinttext: Strings.hintTextFistName,
                prefixicon: Icon(Icons.person),
              ),
              InputField(
                labeltext: Strings.labelTextLastName,
                hinttext: Strings.hintTextLastName,
                prefixicon: Icon(Icons.perm_identity),
              ),
              InputField(
                labeltext: Strings.labelTextPhone,
                hinttext: Strings.hintTextphone,
                prefixicon: Icon(Icons.call),
              ),
              InputField(
                labeltext: Strings.labelTextEmailsSignUp,
                hinttext: Strings.hintTextEmailSignUp,
                prefixicon: Icon(Icons.email_outlined),
              ),
              InputField(
                labeltext: Strings.labelTextPassword,
                hinttext: Strings.hintTextEmailSignUp,
                prefixicon: Icon(Icons.lock),
              ),
              InputField(
                labeltext: Strings.labelTextCity,
                hinttext: Strings.hintTextCity,
                prefixicon: Icon(Icons.location_on),
              ),
              InputField(
                labeltext: Strings.labelTextPaymentMethod,
                hinttext: Strings.hintTextPaymentMethod,
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
