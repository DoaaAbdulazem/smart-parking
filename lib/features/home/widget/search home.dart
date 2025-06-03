import 'package:flutter/material.dart';

class SearchParking extends StatelessWidget implements PreferredSizeWidget {
  const SearchParking({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 213, 213, 213),
      title: TextField(
        decoration: InputDecoration(
          hintText: "Search for your parking spot",
          hintStyle: TextStyle(color: Color.fromARGB(255, 78, 76, 76)),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
