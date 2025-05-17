import 'package:flutter/material.dart';
import 'package:my_project/auth/accountscreen/login.dart';
import 'package:my_project/on_boarding/widget/custombuttom.dart';
import 'package:my_project/on_boarding/widget/onebardingtwoimage.dart';
import 'package:my_project/on_boarding/widget/oneboardingtwotitle.dart';

class OneBoardingScreenTwo extends StatelessWidget {
  const OneBoardingScreenTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OneBoardingTwoImage(imagepath: ("assets/images/photo2.jpg")),
          SizedBox(height: 30),
          OneBoardingScreenTwoTittle(
            title: "Search nearby private parking and reserve your spot.",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 225, 225, 227),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(height: 70),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff787b82),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          MyCustomButtom(
            text: 'next',
            onpressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
