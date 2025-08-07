import 'package:flutter/material.dart';

import '../helper/text_style.dart';
import 'custom_text_field.dart';

class CustomTitleWithTextField extends StatelessWidget {
  const CustomTitleWithTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    required this.controller,
    this.readOnly = false,
  });

  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.bottomSheetStyle),
        const SizedBox(height: 8),
        CustomTextField(
          hint: hintText,
          suffixIcon: suffixIcon,
          controller: controller,
          readOnly: readOnly,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
