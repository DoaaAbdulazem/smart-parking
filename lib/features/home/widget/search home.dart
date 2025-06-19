import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_colors.dart';

class SearchParking extends StatelessWidget implements PreferredSizeWidget {
  const SearchParking({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: TextField(
        decoration: InputDecoration(
          hintText: "Search for your parking spot",
          hintStyle: TextStyle(color: AppColors.bkgColor),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }
}
