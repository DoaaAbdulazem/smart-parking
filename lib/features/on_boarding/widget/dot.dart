import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 20 : 15,

      height: isActive ? 20 : 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.dotColor : AppColors.bkgColor,
      ),
    );
  }
}
