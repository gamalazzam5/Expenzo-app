import 'package:flutter/cupertino.dart';

import 'colors.dart';

Color getMonthColor({required int currentIndex,required int index}){
  if(currentIndex == index){
    return kPrimaryColor;
  }else if(currentIndex>index){
    return Color(0xffEEEEEE);
  }else{
    return Color(0xffBDBDBD);
  }
}