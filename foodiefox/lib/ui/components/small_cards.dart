import 'package:flutter/material.dart';

import '../../../constants.dart';

class SmallCard extends StatelessWidget {
  final String title;
  final Color color_;
  final Function press;

  const SmallCard({
    Key key,
    this.title,
    this.color_,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      height: 120,
      width: 140,
      child: Stack(
        children: <Widget>[
          // Big light background
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 110,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: color_,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
