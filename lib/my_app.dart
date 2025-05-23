import 'package:flutter/material.dart';
import 'package:my_project/features/on_boarding/screens/on_boarding_screen_one.dart';
import 'package:my_project/core/theme/app_themeing.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeing.lightTheme,
      debugShowCheckedModeBanner: false,
      home: OnBordingneScreenOne(),
    );
  }
}
