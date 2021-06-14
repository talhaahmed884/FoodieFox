import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';
import 'package:foodiefox_customer/ui/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodieFox',
      theme: ThemeData(
        primaryColor: primary_Yellow,
        scaffoldBackgroundColor: bg_Color,
        fontFamily: 'Circular',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: black),
          bodyText2: TextStyle(color: black),
        ),
      ),
      home: Splash(),
    );
  }
}
