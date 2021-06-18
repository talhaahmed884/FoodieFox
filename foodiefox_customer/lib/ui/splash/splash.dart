import 'package:flutter/material.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';
import 'package:foodiefox_customer/ui/login/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_splashButton(context), _splashScreen()],
      ),
    );
  }
}

Widget _splashButton(BuildContext context) {
  return Positioned.fill(
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: primary_Yellow),
      child: Container(
        height: 125,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => Login()));
          },
          child: Container(
            width: 80,
            height: 80,
            child: Icon(Icons.arrow_forward_ios, color: primary_Yellow),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _splashScreen() {
  return Positioned.fill(
      bottom: 130,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60))),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/images/fox.png'),
              Container(
                margin: EdgeInsets.only(left: 70),
                child: Column(
                  children: [
                    Text('Dine-Inn and Take away',
                        style: GoogleFonts.varelaRound(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                    Text('Lets have the best restaurant',
                        style: GoogleFonts.varelaRound(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                            height: 2.5)),
                    Text('experience with FoodieFox :)))',
                        style: GoogleFonts.varelaRound(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}
