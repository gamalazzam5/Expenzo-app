import 'package:expenzo_app/helper/app_assets.dart';
import 'package:expenzo_app/helper/colors.dart';
import 'package:expenzo_app/helper/text_style.dart';
import 'package:expenzo_app/widgets/expense_month_filter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/show_modal_sheet.dart';
import '../widgets/expense_data.dart';
import '../widgets/expense_empty_state .dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentDay = DateFormat('EEEE').format(DateTime.now());
  final dayNumber = DateFormat('d').format(DateTime.now());
  final monthName = DateFormat('MMMM').format(DateTime.now());
  TextEditingController noteTitle = TextEditingController();
  TextEditingController noteAmount = TextEditingController();
  TextEditingController noteCategory = TextEditingController();
  TextEditingController noteDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32),
        ),
        backgroundColor: kPrimaryColor,
        onPressed: (){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context, builder: (context){
            return ShowModalSheet(noteAmount: noteAmount,
            noteTitle: noteTitle,
            noteCategory: noteCategory,
            noteDate: noteDate,);
          });
        },child: Icon(Icons.add,color: Colors.white,),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children:  [
              ListTile(
                title: Text('My expenses:', style: TextStyles.semiBoldStyle),
                subtitle: Text(
                  '$currentDay, $dayNumber $monthName',
                  style: TextStyles.dateTextStyle,
                ),
                trailing: Image.asset(
                  AppAssets.hamburgerMenu,
                  height: 28,
                  width: 28,
                ),
              ),
              const SizedBox(height: 57),
              const Center(
                child: Text("\$0.00", style: TextStyles.totalAmountStyle),
              ),
              const SizedBox(height: 57),
              const ExpenseMonthFilter(),
              const SizedBox(height: 40),
             const ExpenseEmptyState(),
              // const ExpenseDataState(),

            ],
          ),
        ),
      ),
    );
  }
}

