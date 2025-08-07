import 'package:expenzo_app/helper/colors.dart';
import 'package:expenzo_app/models/expense_model.dart';
import 'package:flutter/material.dart';

import '../database/sqflite.dart';
import '../helper/methods.dart';
import '../helper/text_style.dart';

class ExpenseDataState extends StatefulWidget {
  const ExpenseDataState({
    super.key,
    required this.expenses,
  });

  final List<ExpenseModel> expenses;

  @override
  State<ExpenseDataState> createState() => _ExpenseDataStateState();
}

class _ExpenseDataStateState extends State<ExpenseDataState> {
  void _deleteExpense(int index) async {
    final expense = widget.expenses[index];
    final id = expense.id;

    if (id != null) {
      await SqlDb().deleteExpenseById(id);
      setState(() {
        widget.expenses.removeAt(index);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The expense was deleted'),backgroundColor: kPrimaryColor,),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          final expense = widget.expenses[index];

          return Dismissible(
            key: ValueKey(expense.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete_forever, color: Colors.white),
            ),
            onDismissed: (_) => _deleteExpense(index),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Image.asset(
                      getIconPath(expense.category),
                      height: 35,
                      width: 32,
                    ),
                  ),
                ),
                title: Text(
                  expense.date,
                  style: const TextStyle(
                    color: Color(0xff616161),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  expense.title,
                  style: const TextStyle(
                    color: Color(0xff424242),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  '${expense.amount}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
