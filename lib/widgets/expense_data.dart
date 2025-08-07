import 'package:expenzo_app/helper/colors.dart';
import 'package:flutter/material.dart';

import '../helper/methods.dart';
import '../helper/text_style.dart';

class ExpenseDataState extends StatefulWidget {
  const ExpenseDataState({super.key});


  @override
  State<ExpenseDataState> createState() => _ExpenseDataStateState();
}

class _ExpenseDataStateState extends State<ExpenseDataState> {
List items = [];

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              setState(() {
                // category.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                    ),
                    child: Icon(Icons.delete_forever, color: Colors.white),
                  ),
                ],
              ),
            ),

            key: ValueKey(index),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                
                leading: items.isNotEmpty? Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Image.asset(
                     '',

                      height: 35,
                      width: 32,
                    ),
                  ),
                ):null,
                title: Text(
                 '',
                  style: TextStyle(
                    color: Color(0xff616161),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  '',
                  style: TextStyle(
                    color: Color(0xff424242),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                 '',
                  style: TextStyle(
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
