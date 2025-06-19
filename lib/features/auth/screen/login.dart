import 'package:flutter/material.dart';
import 'package:my_project/core/consts/app_size.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/core/theme/app_colors.dart';
import 'package:my_project/features/auth/widget/app_bar_loginscreen.dart';
import 'package:my_project/features/auth/widget/forget_password.dart';
import 'package:my_project/features/auth/widget/input_field.dart';
import 'package:my_project/features/auth/widget/login_botton.dart';
import 'package:my_project/features/auth/widget/sign_up_bottom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController =
        TextEditingController(); // تحكم بحقل كلمة المرور
    return Scaffold(
      backgroundColor: AppColors.bkgColor,
      appBar: CustomAppBar(title: "Login"), // شريط العنوان الخاص بالتسجيل
      body: Container(
        margin: const EdgeInsets.only(top: AppSize.loginContainerTopMargin),

        padding: const EdgeInsets.all(AppSize.defaultPadding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.loginBorderRadius),
            topRight: Radius.circular(AppSize.loginBorderRadius),
          ),
        ),
        child: Column(
          spacing: AppSize.spaceBetweenFields,
          children: [
            SizedBox(height: AppSize.spaceAfterLogo),
            // حقل إدخال البريد الإلكتروني
            InputField(
              labeltext: Strings.labelTextEmail,
              hinttext: Strings.hintTextEnterEmailOrPhone,
              prefixicon: const Icon(Icons.email),
            ),
            // حقل إدخال كلمة المرور
            InputField(
              labeltext: Strings.labelTextPassword,
              hinttext: Strings.hintTextEnterPassword,
              prefixicon: const Icon(Icons.lock),
              controller: passwordController,
            ),
            // نسيت كلمة المرور؟
            ForgetPassword(),

            SizedBox(
              width: double.infinity,
              height: AppSize.underForgetPaaword,

              child: LoginButton(passwordController: passwordController),
            ),

            SizedBox(height: AppSize.spaceAfterButton),
            //إنشاء حساب جديد
            SignUpBottom(),
          ],
        ),
      ),
    );
  }
}
