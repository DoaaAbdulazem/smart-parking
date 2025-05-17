import 'package:flutter/material.dart';
import 'package:my_project/auth/accountscreen/login.dart';
import 'package:my_project/on_boarding/screens/oneboardingscreentwo.dart';
import 'package:my_project/on_boarding/widget/custombuttom.dart';
import 'package:my_project/on_boarding/widget/onebardingonetitle.dart';
import 'package:my_project/on_boarding/widget/onebardingoneimage.dart';

class OnbordingneOneScreen extends StatelessWidget {
  const OnbordingneOneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          OneboardingOneImage(imagePath: 'assets/images/photo1.jpg'),

          OnebardingOneDesc(
            title:
                "Welcome to smart parking \n Enjoy your trip your car is safe",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff787b82),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(height: 70),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 225, 225, 227),
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyCustomButtom(
                text: 'skip',
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
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
    );
  }
}
