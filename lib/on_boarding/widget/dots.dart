import 'package:flutter/material.dart';
import 'package:my_project/on_boarding/widget/dot.dart';

class Dots extends StatelessWidget {
  const Dots({super.key, required this.list});
  final List<Dot> list;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: list,
    );
  }
}
