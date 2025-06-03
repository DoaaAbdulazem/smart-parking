import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book your seat now",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.yallowColor,
          ),
        ),
        backgroundColor: AppColors.bkgColor,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2,
          children: [
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "A01",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "A02",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "B01",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "B02",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "A03",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "A04",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "B03",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                "B04",
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
