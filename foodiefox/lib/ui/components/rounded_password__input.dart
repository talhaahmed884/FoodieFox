import 'package:flutter/material.dart';
import 'package:foodiefox/ui/components/input_container.dart';
import 'package:foodiefox/ui/components/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key key, @required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        keyboardType: TextInputType.number,
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
