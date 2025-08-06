import 'package:flutter/material.dart';

import '../helper/text_style.dart';

class ExpenseDataState extends StatelessWidget {
  const ExpenseDataState({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context,index){

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            leading: Container(width: 56,height: 56,
            decoration: BoxDecoration(color: Color(0xffF5F5F5),borderRadius: BorderRadius.circular(30),
            ),
              child: Center(child: Image.asset('assets/images/icons/coffee_icon.png',height: 35,width: 32,)),
            ),
            title: Text('Wednesday, 2 July 2025',style: TextStyle(color: Color(0xff616161),fontSize: 13,fontWeight: FontWeight.w500),),
            subtitle: Text('Coffee',style: TextStyle(color: Color(0xff424242),fontSize: 16,fontWeight: FontWeight.bold),),
            trailing: Text(r'-$5.00',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
          ),
        );
      }),
    );
  }
}
