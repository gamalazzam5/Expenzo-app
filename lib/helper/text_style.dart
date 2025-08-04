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
}
