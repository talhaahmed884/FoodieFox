import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'verify_phone.dart';

void main()
{
  runApp(MyApp()) ;
}

class MyApp extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Flutter app",
      theme:ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      home: VerifyPhone(phoneNumber: '123456789'),
    );
  }
}