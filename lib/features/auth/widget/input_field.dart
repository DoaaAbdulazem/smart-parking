import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hinttext,
        prefixIcon: prefixicon,
      ),
    );
  }
}
