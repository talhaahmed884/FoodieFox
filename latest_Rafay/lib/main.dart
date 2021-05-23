import 'package:flutter/material.dart';
import 'package:sprint2/screens/home/main_HomePage.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie Fox',
      theme: ThemeData(
        primaryColor: primary_Yellow,
        scaffoldBackgroundColor: bg_Color,
        fontFamily: 'Circular',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: black),
          bodyText2: TextStyle(color: black),
        ),
      ),
      home: HomePage(),
    );
  }
}
