import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: Center(
        child: SpinKitSquareCircle(
          color: kPrimaryColor,
          size: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
