import 'package:expenzo_app/database/sqflite.dart';
import 'package:expenzo_app/helper/app_assets.dart';
import 'package:expenzo_app/helper/colors.dart';
import 'package:expenzo_app/helper/text_style.dart';
import 'package:expenzo_app/models/expense_model.dart';
import 'package:expenzo_app/widgets/expense_month_filter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/expense_empty_state .dart';
import '../widgets/show_modal_sheet.dart';
import '../widgets/expense_data.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SqlDb dataBase = SqlDb();
  final currentDay = DateFormat('EEEE').format(DateTime.now());
  final dayNumber = DateFormat('d').format(DateTime.now());
  final monthName = DateFormat('MMMM').format(DateTime.now());
  TextEditingController noteTitle = TextEditingController();
  TextEditingController noteAmount = TextEditingController();
  TextEditingController noteCategory = TextEditingController();
  TextEditingController noteDate = TextEditingController();
  late Future<List<ExpenseModel>> _expensesFuture;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  double totalAmount = 0.0;

  @override
  void initState() {
    _refreshExpenses();
    super.initState();
  }

  void _refreshExpenses() {
    setState(() {
      _expensesFuture = fetchExpenses().then((list) {
        setState(() {
          totalAmount = list.fold(0.0, (sum, expense) => sum + expense.amount);
        });
        return list;
      });
    });
  }

  Future<List<ExpenseModel>> fetchExpenses() async {
    final List<Map<String, dynamic>> maps = await dataBase.read('expenses');
    List<ExpenseModel> expenses = maps.map((e) => ExpenseModel.fromMap(e)).toList();

    // Filter expenses by selected month and year
    expenses = expenses.where((expense) {
      final expenseDate = DateFormat('d MMM yyyy').parse(expense.date);
      return expenseDate.month == selectedMonth && expenseDate.year == selectedYear;
    }).toList();

    return expenses;
  }

  void _onMonthSelected(int monthIndex) {
    setState(() {
      selectedMonth = monthIndex + 1;
    });
    _refreshExpenses();
  }

  void _onExpenseDeleted() {
    _refreshExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ShowModalSheet(
                onAdd: () => _refreshExpenses(),
                database: dataBase,
                noteAmount: noteAmount,
                noteTitle: noteTitle,
                noteCategory: noteCategory,
                noteDate: noteDate,
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
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
              Center(
                child: Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyles.totalAmountStyle,
                ),
              ),
              const SizedBox(height: 57),
              ExpenseMonthFilter(onMonthSelected: _onMonthSelected),
              const SizedBox(height: 40),
              FutureBuilder<List<ExpenseModel>>(
                future: _expensesFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final List<ExpenseModel> expenses = snapshot.data!;
                    return ExpenseDataState(
                      expenses: expenses,
                      onExpenseDeleted: _onExpenseDeleted,
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const ExpenseEmptyState();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}