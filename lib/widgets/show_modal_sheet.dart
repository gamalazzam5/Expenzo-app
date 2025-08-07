import 'package:expenzo_app/database/sqflite.dart';
import 'package:expenzo_app/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helper/text_style.dart';
import '../models/expense_model.dart';
import 'custom_title_with_text_field.dart';
import 'drop_down_menu.dart';

class ShowModalSheet extends StatefulWidget {
  const ShowModalSheet({
    super.key,
    required this.noteTitle,
    required this.noteAmount,
    required this.noteCategory,
    required this.noteDate,
    required this.database,
    required this.onAdd,
  });

  final SqlDb database;
  final TextEditingController noteTitle;
  final TextEditingController noteAmount;
  final TextEditingController noteCategory;
  final TextEditingController noteDate;
  final VoidCallback onAdd;

  @override
  State<ShowModalSheet> createState() => _ShowModalSheetState();
}

class _ShowModalSheetState extends State<ShowModalSheet> {
  String? selectedCategory;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 642,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16.0,
          left: 16,
          top: 24,
          bottom: 12,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xffCCCCCC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTitleWithTextField(
                  controller: widget.noteTitle,
                  title: 'Description',
                  hintText: 'What did you spend on?',
                ),
                CustomTitleWithTextField(
                  controller: widget.noteAmount,
                  title: 'Amount',
                  hintText: '0.00',
                ),

                CategoryDropdown(
                  selectedCategory: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      widget.noteCategory.text = value;
                      print(widget.noteCategory.text);
                    });
                  },
                ),
                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        widget.noteDate.text = DateFormat(
                          'd MMM yyyy',
                        ).format(pickedDate);
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: CustomTitleWithTextField(
                      readOnly: true,
                      controller: widget.noteDate,
                      title: 'Date',
                      hintText: 'Select Date',
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 27),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                     int response = await widget.database.insert(
                        'expenses',
                        ExpenseModel(
                          title: widget.noteTitle.text,
                          date: widget.noteDate.text,
                          amount:
                              double.tryParse(widget.noteAmount.text) ?? 0.0,
                          category: widget.noteCategory.text,
                        ).toMap(),
                      );
                      if(response >0){
                      widget.onAdd();
                      widget.noteTitle.clear();
                      widget.noteAmount.clear();
                      widget.noteCategory.clear();
                      widget.noteDate.clear();
                      Navigator.pop(context);}
                    }
                  },
                  child: Text("Add", style: TextStyles.buttonOnboardingStyle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    minimumSize: const Size(360, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel', style: TextStyles.cancelStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
