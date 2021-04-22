import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiefox/ui/components/input_container.dart';
import 'package:foodiefox/ui/components/constants.dart';

class RoundedPhoneInput extends StatelessWidget {
  const RoundedPhoneInput(
      {Key key,
      @required this.icon,
      @required this.hint,
      @required this.cellNoController})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextEditingController cellNoController;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
          controller: cellNoController,
          keyboardType: TextInputType.phone,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            icon: Icon(icon, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none,
          )),
    );
  }
}
