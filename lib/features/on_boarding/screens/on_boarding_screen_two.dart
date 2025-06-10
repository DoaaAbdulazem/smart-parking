/*
import 'package:flutter/material.dart';
import 'package:my_project/core/consts/assets.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/features/auth/screen/login.dart';
import 'package:my_project/features/on_boarding/widget/custom_button.dart';
import 'package:my_project/features/on_boarding/widget/dot.dart';
import 'package:my_project/features/on_boarding/widget/dots.dart';
import 'package:my_project/features/on_boarding/widget/on_boarding_image.dart';
import 'package:my_project/features/on_boarding/widget/on_boarding_title.dart';

class OneBoardingScreenTwo extends StatelessWidget {
  const OneBoardingScreenTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OneBoardingImage(imagePath: Assets.onBordingTwoImage),
            SizedBox(height: 30),
            OnBoardingTitle(
              title: Strings.wlecomePagetwo,
              subtitle: Strings.welcomePageTwoSecond,
            ),
            SizedBox(height: 30),
            Dots(list: [Dot(isActive: false), Dot(isActive: true)]),
            const SizedBox(height: 40),
            SizedBox(
              width: 150,
              child: MyCustomButtom(
                text: Strings.getStartedBotton,
                onpressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                      fullscreenDialog: true,
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
