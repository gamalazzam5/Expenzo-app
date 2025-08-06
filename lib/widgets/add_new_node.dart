import 'package:expenzo_app/helper/colors.dart';
import 'package:expenzo_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../helper/text_style.dart';
import 'custom_title_with_text_field.dart';

class AddNewNoteBottomSheet extends StatelessWidget {
  const AddNewNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 614,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16.0,
          left: 16,
          top: 24,
          bottom: 12,
        ),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 5,
              decoration: BoxDecoration(
                color: Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            CustomTitleWithTextField(
              title: 'Description',
              hintText: 'What did you spend on?',
            ),
            CustomTitleWithTextField(title: 'Amount', hintText: '0.00'),
            CustomTitleWithTextField(
              title: 'Category',
              hintText: 'Select Category',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
              ),
            ),
            CustomTitleWithTextField(
              title: 'Date',
              hintText: 'Select Date',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
              ),
            ),
            const SizedBox(height: 27),
            ElevatedButton(
              onPressed: () {},
              child: Text("Add", style: TextStyles.buttonOnboardingStyle),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: Size(360, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

              ),
            ),
            const SizedBox(height: 16,),
            Text('Cancel',style: TextStyles.cancelStyle,)
          ],
        ),
      ),
    );
  }
}
