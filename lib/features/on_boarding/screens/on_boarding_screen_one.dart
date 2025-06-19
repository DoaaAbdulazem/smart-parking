import 'package:flutter/material.dart';
import 'package:my_project/core/consts/assets.dart';
import 'package:my_project/core/consts/strings.dart';
import 'package:my_project/features/auth/screen/free_parking.dart';
import 'package:my_project/features/auth/screen/login.dart';

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
  PageController _pageController = PageController();

  // دالة التخطي (توجه مباشرة لصفحة تسجيل الدخول)
  void skipLogic() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  // دالة التالي (توجه للصفحة التالية أو للتسجيل إذا كانت الأخيرة)
  void nextLogic() {
    if (_currentPage < onBordingList.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  // دالة البدء (توجه للشاشة الرئيسية مباشرة)
  void getStarted() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // التمرير بين الصفحات وتحديث الواجهة عند تغيير الصفحة الحالية
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder:
                    (context, index) =>
                        OnBordingBody(onBoardingModel: onBordingList[index]),
                itemCount: onBordingList.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            //نقاط مؤشر الصفحة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onBordingList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Dot(isActive: _currentPage == index),
                );
              }),
            ),

            // أزرار التنقل (تخطي/التالي/بدءالاستخدام)
            Row(
              spacing: 70,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_currentPage < onBordingList.length - 1)
                  MyCustomButtom(
                    onpressed: skipLogic,
                    text: Strings.skipBotton,
                  ),

                _currentPage < onBordingList.length - 1
                    ? MyCustomButtom(
                      onpressed: nextLogic,
                      text: Strings.nextBotton,
                    )
                    : Expanded(
                      child: MyCustomButtom(
                        onpressed: nextLogic,
                        text: Strings.getStartedBotton,
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

// ويدجت لعرض محتوى كل صفحة من صفحات Onboarding
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

// Model data for Onboarding
// نموذج الصفحة الأولى
OnBoardingModel oneOnBoardingModel = OnBoardingModel(
  title: Strings.welcomePageOne,
  description: Strings.welcomePageOneSecond,
  image: Assets.onBordingOneImage,
);
// نموذج الصفحة الثانية
OnBoardingModel twoOnbordingModel = OnBoardingModel(
  title: Strings.wlecomePagetwo,
  description: Strings.welcomePageTwoSecond,
  image: Assets.onBordingTwoImage,
);
// قائمة بجميع صفحات Onboarding
final List<OnBoardingModel> onBordingList = [
  oneOnBoardingModel,
  twoOnbordingModel,
];
