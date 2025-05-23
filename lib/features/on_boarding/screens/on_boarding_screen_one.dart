import 'package:flutter/material.dart';
import 'package:my_project/core/consts/assets.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/features/auth/screen/login.dart';
import 'package:my_project/features/on_boarding/screens/on_boarding_screen_two.dart';
import 'package:my_project/features/on_boarding/widget/custom_button.dart';
import 'package:my_project/features/on_boarding/widget/dot.dart';
import 'package:my_project/features/on_boarding/widget/dots.dart';
import 'package:my_project/features/on_boarding/widget/on_boarding_title.dart';
import 'package:my_project/features/on_boarding/widget/on_boarding_image.dart';

class OnBordingneScreenOne extends StatelessWidget {
  const OnBordingneScreenOne({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            OneBoardingImage(imagePath: Assets.onBordingOneImage),

            OnBoardingTitle(
              title: Strings.welcomePageOne,
              subtitle: Strings.welcomePageOneSecond,
            ),
            SizedBox(height: 30),
            Dots(list: [Dot(isActive: true), Dot(isActive: false)]),

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: MyCustomButtom(
                    text: Strings.skipBotton,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: MyCustomButtom(
                    text: Strings.nextBotton,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OneBoardingScreenTwo(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
