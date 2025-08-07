import 'package:expenzo_app/views/home_view.dart';
import 'package:flutter/material.dart';

import 'views/splash_screen.dart';

void main() {
  runApp(ExpenzoApp());
}

class ExpenzoApp extends StatelessWidget {
  const ExpenzoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}
