import 'package:flutter/material.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primary_Yellow.withAlpha(50)),
        child: child);
  }
}
