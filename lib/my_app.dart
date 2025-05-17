import 'package:flutter/material.dart';
import 'package:my_project/on_boarding/screens/on_boarding_screen_one.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBordingneScreenOne(),
    );
  }
}
