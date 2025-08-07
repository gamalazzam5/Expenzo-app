import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.suffixIcon,
    required this.controller,
    this.readOnly = false,
  });

  final String hint;
  final int maxLines;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      maxLines: maxLines,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: TextStyle(color: Color(0xffAAAAAA)),
        border: buildBorder(Color(0xFFCCCCCC)),
        enabledBorder: buildBorder(Color(0xFFCCCCCC)),
        focusedBorder: buildBorder(Color(0xFFCCCCCC)),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
