import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiefox_customer/ui/components/input_container.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput(
      {Key key,
      @required this.icon,
      @required this.hint,
      @required this.textInputType,
      @required this.textEditingController})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: textEditingController,
        cursorColor: primary_Yellow,
        keyboardType: textInputType,
        decoration: InputDecoration(
            icon: Icon(icon, color: primary_Yellow),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
