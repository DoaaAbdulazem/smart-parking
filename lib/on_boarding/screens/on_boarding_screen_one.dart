import 'package:flutter/material.dart';
import 'package:my_project/auth/screen/login.dart';
import 'package:my_project/on_boarding/screens/on_boarding_screen_two.dart';
import 'package:my_project/on_boarding/widget/custombuttom.dart';
import 'package:my_project/on_boarding/widget/dot.dart';
import 'package:my_project/on_boarding/widget/dots.dart';
import 'package:my_project/on_boarding/widget/on_boarding_title.dart';
import 'package:my_project/on_boarding/widget/on_boarding_image.dart';

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
            OneBoardingImage(imagePath: 'assets/images/photo1.jpg'),

            OnBoardingTitle(
              title:
                  "Welcome to smart parking \n Enjoy your trip your car is safe",
            ),
            SizedBox(height: 30),
            Dots(list: [Dot(isActive: true), Dot(isActive: false)]),

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyCustomButtom(
                  text: 'skip',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
                MyCustomButtom(
                  text: "Next",
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OneBoardingScreenTwo(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
