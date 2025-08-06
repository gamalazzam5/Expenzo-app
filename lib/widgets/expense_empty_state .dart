import 'package:flutter/material.dart';

import '../helper/app_assets.dart';
import '../helper/text_style.dart';

class ExpenseEmptyState extends StatelessWidget {
  const ExpenseEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.piggyBankImage,
            height: 120,
            width: 120,
          ),
          const SizedBox(height: 12),
          const Text(
            "You don't have any expense at the moment.",
            style: TextStyles.subTitleEmptyPage,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.info, color: Color(0xffCCCCCC)),
              SizedBox(width: 4,),
              Column(
                children: [
                  Text(
                    "Try clicking the button above, ",
                    style: TextStyles.subTitleEmptyPage,
                  ),
                  Text(
                    "or click here to create a new one.",
                    style: TextStyles.subTitleEmptyPage,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
