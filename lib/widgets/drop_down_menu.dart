import 'package:flutter/material.dart';

import '../helper/text_style.dart';

class CategoryItem {
  final String name;
  final String iconPath;

  CategoryItem({required this.name, required this.iconPath});
}

final List<CategoryItem> categoryItems = [
  CategoryItem(name: 'Coffee', iconPath: 'assets/images/icons/coffee_icon.png'),
  CategoryItem(name: 'Transport', iconPath: 'assets/images/icons/car_icon.png'),
  CategoryItem(name: 'Pets', iconPath: 'assets/images/icons/pets_icon.png'),
  CategoryItem(name: 'Food', iconPath: 'assets/images/icons/burger_icon.png'),
];

class CategoryDropdown extends StatelessWidget {
  final String? selectedCategory;
  final Function(String) onChanged;
  final String hintText;
  final Widget? suffixIcon;

  const CategoryDropdown({
    Key? key,
    required this.selectedCategory,
    required this.onChanged,
    this.hintText = 'Select Category',
    this.suffixIcon,
  }) : super(key: key);

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? const Color(0xFFCCCCCC)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: TextStyles.bottomSheetStyle),
        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: selectedCategory,
          isExpanded: true,
          icon: suffixIcon ?? const Icon(Icons.keyboard_arrow_down),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xffAAAAAA)),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          items: categoryItems.map((item) {
            return DropdownMenuItem<String>(
              value: item.name,
              child: Row(
                children: [
                  Image.asset(item.iconPath, width: 32, height: 35),
                  const SizedBox(width: 10),
                  Text(item.name),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ],
    );
  }
}
