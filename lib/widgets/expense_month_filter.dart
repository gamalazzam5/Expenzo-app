import 'package:flutter/material.dart';

import '../helper/methods.dart';

class ExpenseMonthFilter extends StatefulWidget {
  const ExpenseMonthFilter({super.key, required this.onMonthSelected});

  final Function(int) onMonthSelected;

  @override
  State<ExpenseMonthFilter> createState() => _ExpenseMonthFilter();
}

class _ExpenseMonthFilter extends State<ExpenseMonthFilter> {
  late ScrollController _scrollController;
  int currentIndex = DateTime.now().month - 1;
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  void _scrollToCurrentMonth() {
    final double itemWidth = 32.8;
    _scrollController.animateTo(
      currentIndex * itemWidth,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.onMonthSelected(index);
              });
            },
            child: Container(
              width: 52,
              height: 23,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: getMonthColor(currentIndex: currentIndex, index: index),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: Text(
                  months[index],
                  style: TextStyle(
                    color: currentIndex == index
                        ? Color(0xFFFFFFFF)
                        : Color(0xFF616161),
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