import 'package:flutter/material.dart';

import '../constants.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor.withAlpha(50)),
        child: child);
  }
}
