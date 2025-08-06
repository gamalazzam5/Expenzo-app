import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLines = 1, this.suffixIcon});

  final String hint;
  final int maxLines;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,

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
