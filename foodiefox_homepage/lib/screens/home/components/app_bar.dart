import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiefox_homepage/constants.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      iconSize: 35.0,
      padding: const EdgeInsets.only(
        left: 30,
        top: 0,
        right: 0,
        bottom: 0,
      ),
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        iconSize: 35.0,
        padding: const EdgeInsets.only(
          left: 0,
          top: 0,
          right: 30,
          bottom: 0,
        ),
        icon: Image.asset("assets/icons/displayPlaceHolder.png"),
        onPressed: () {},
      ),
    ],
  );
}
