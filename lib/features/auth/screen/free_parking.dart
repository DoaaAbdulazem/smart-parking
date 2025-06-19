import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';
import 'package:my_project/features/auth/screen/signup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          },
        ),
        title: Text(
          "show your seat now",
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppColors.yallowColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Taken",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppColors.bkgColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Available",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // زر الريفريش على اليمين
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.refresh, color: AppColors.yallowColor),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2, //صفين
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bkgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A01",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.yallowColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A02",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.yallowColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A03",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bkgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A04",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.yallowColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A05",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bkgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A06",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bkgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A07",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bkgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A08",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.bkgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A09",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.yallowColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "A10",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
