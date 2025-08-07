import 'package:flutter/cupertino.dart';

import 'colors.dart';

Color getMonthColor({required int currentIndex, required int index}) {
  if (currentIndex == index) {
    return kPrimaryColor;
  } else if (currentIndex > index) {
    return Color(0xffEEEEEE);
  } else {
    return Color(0xffBDBDBD);
  }
}

String getIconPath(String categoryName) {
  switch (categoryName) {
    case 'Coffee':
      return 'assets/images/icons/coffee_icon.png';
    case 'Transport':
      return 'assets/images/icons/car_icon.png';
    case 'Pets':
      return 'assets/images/icons/pets_icon.png';
    case 'Food':
      return 'assets/images/icons/burger_icon.png';
    default:
      return 'assets/images/icons/coffee_icon.png';
  }
}
