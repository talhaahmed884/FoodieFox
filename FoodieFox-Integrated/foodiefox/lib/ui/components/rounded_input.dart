import 'package:flutter/material.dart';
import 'input_container.dart';
import 'constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput(
      {Key key,
      @required this.icon,
      @required this.hint,
      @required this.fieldController})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextEditingController fieldController;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: fieldController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(icon, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
