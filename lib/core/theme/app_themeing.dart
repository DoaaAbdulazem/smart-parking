import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';
import 'package:my_project/core/theme/app_text_style.dart';

class AppThemeing {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    // هون للاب بار
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bkgColor,
      centerTitle: true,
      foregroundColor: AppColors.white,
      titleTextStyle: AppTextStyle.appBarTextStyle,
    ),
    //هون للزر
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yallowColor,
        foregroundColor: Colors.black,
        textStyle: AppTextStyle.buttonText,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillColorInput,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),

    colorScheme: ColorScheme.light(primary: AppColors.yallowColor),
  );
}
