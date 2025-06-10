import 'package:flutter/material.dart';
import 'package:my_project/core/consts/assets.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/features/on_boarding/model/onboarding_model.dart';
import 'package:my_project/features/on_boarding/widget/custom_button.dart';

import 'package:my_project/features/on_boarding/widget/dot.dart';
import 'package:my_project/features/on_boarding/widget/on_boarding_image.dart';
import 'package:my_project/features/on_boarding/widget/on_boarding_title.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder:
                    (context, index) =>
                        OnBordingBody(onBoardingModel: onBordingList[index]),

                itemCount: onBordingList.length,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dot(isActive: _currentPage == 0),
                SizedBox(width: 8),
                Dot(isActive: _currentPage == 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}

class OnBordingBody extends StatelessWidget {
  final OnBoardingModel onBoardingModel;

  const OnBordingBody({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OneBoardingImage(imagePath: onBoardingModel.image),
        OnBoardingTitle(
          title: onBoardingModel.title,
          subtitle: onBoardingModel.description,
        ),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////////////////
OnBoardingModel oneOnBoardingModel = OnBoardingModel(
  title: Strings.welcomePageOne,
  description: Strings.welcomePageOneSecond,
  image: Assets.onBordingOneImage,
);
OnBoardingModel twoOnbordingModel = OnBoardingModel(
  title: Strings.wlecomePagetwo,
  description: Strings.welcomePageTwoSecond,
  image: Assets.onBordingTwoImage,
);
final List<OnBoardingModel> onBordingList = [
  oneOnBoardingModel,
  twoOnbordingModel,
];
