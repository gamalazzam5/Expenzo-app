import 'package:expenzo_app/helper/colors.dart';
import 'package:flutter/material.dart';

import 'app_assets.dart';

class TextStyles {
  TextStyles._();

  static const TextStyle skipStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: AppAssets.kPrimaryFont,
    color: Color(0xff666666),
  );
  static const TextStyle titleOnboardingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: AppAssets.kPrimaryFont,
    color: Color(0xff333333),
  );
  static const TextStyle subTitleOnboardingStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: AppAssets.kPrimaryFont,
    color: Color(0xff333333),
  );
  static const TextStyle buttonOnboardingStyle = TextStyle(
    color: Colors.white,
    fontFamily: AppAssets.kPrimaryFont,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle semiBoldStyle = TextStyle(
    color: Colors.black,
    fontFamily: AppAssets.kPrimaryFont,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static const TextStyle dateTextStyle = TextStyle(
    color: Color(0xff424242),
    fontFamily: AppAssets.kPrimaryFont,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static const TextStyle totalAmountStyle = TextStyle(
    color: kPrimaryColor,

    // fontFamily: AppAssets.kPrimaryFont,
    fontWeight: FontWeight.w600,
    fontSize: 48,
  );
  static const TextStyle subTitleEmptyPage = TextStyle(
    color: Color(0xff888888),
    fontFamily: AppAssets.kPrimaryFont,

    fontWeight: FontWeight.w600,
    fontSize: 12,
  );
  static const TextStyle bottomSheetStyle = TextStyle(
    color: Colors.black,
    fontFamily: AppAssets.kPrimaryFont,

    fontWeight: FontWeight.w700,
    fontSize: 12,
  );

  static const TextStyle cancelStyle = TextStyle(
    color: Color(0xffAAAAAA),
    fontFamily: AppAssets.kPrimaryFont,
    fontWeight: FontWeight.w800,
    fontSize: 18,
  );
}
