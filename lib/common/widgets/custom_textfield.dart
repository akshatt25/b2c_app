import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextField(
      {required this.controller,
      super.key,
      required this.hintText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter you $hintText';
        }
        if (hintText == 'Password' && val.length < 6) {
          return 'Enter a password minimum of 6 character';
        }
        return null;
      },
    );
  }
}
