// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class inputfield extends StatelessWidget {
  const inputfield({
    super.key,
    required this.labeltext,
    required this.hinttext,
    required this.prefixicon,
    this.controller,
  });

  final String labeltext;
  final String hinttext;
  final Icon prefixicon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labeltext,
          hintText: hinttext,
          prefixIcon: prefixicon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
