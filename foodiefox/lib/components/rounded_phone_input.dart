import 'package:flutter/material.dart';
import 'package:foodiefox/components/input_container.dart';

import '../constants.dart';

class RoundedPhoneInput extends StatelessWidget {
  const RoundedPhoneInput({Key key, @required this.icon, @required this.hint})
      : super(key: key);

  final IconData icon;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        keyboardType: TextInputType.number,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(icon, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
