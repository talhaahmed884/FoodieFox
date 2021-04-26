import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_splashButton(), _splashScreen()],
      ),
    );
  }

  Widget _splashButton() {
    return Positioned.fill(
        child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: KsplashButtonColor),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Get Started',
            style: GoogleFonts.varelaRound(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    ));
  }

  Widget _splashScreen() {
    return Positioned.fill(
        bottom: 70,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('assets/images/fox.png'),
                Text('Dine-Inn and Take away',
                    style: GoogleFonts.varelaRound(
                        fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
