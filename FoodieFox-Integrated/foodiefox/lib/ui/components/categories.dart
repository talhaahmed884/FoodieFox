import 'package:flutter/material.dart';
import 'constants.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
      ),
      indicatorPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      tabs: <Widget>[
        Tab(text: 'Restaurants'),
        Tab(text: 'Vibe Check'),
        Tab(text: 'Hot Now'),
        // Tab(text: 'Ne'),
      ],
    );
  }
}
