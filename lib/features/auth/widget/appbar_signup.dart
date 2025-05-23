import 'package:flutter/material.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/core/theme/app_colors.dart';

class AppBarSignUp extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Strings.appBarSignUpScreen),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
