import 'package:flutter/material.dart';

import '../../../constants.dart';

class RestaurantCard extends StatelessWidget {
  final String title;
  final String state;
  final String image;
  final String description;
  final Function press;

  const RestaurantCard({
    Key key,
    this.title,
    this.state,
    this.image,
    this.description,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      height: 320,
      width: 270,
      child: Stack(
        children: <Widget>[
          // Big light background
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 320,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: kPrimaryColor.withOpacity(.1),
              ),
            ),
          ),
          // Rounded background
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 181,
              width: 181,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor.withOpacity(.4),
              ),
            ),
          ),
          // Food Image
          Positioned(
            top: 0,
            left: -50,
            child: Container(
              height: 184,
              width: 276,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Positioned(
            top: 201,
            left: 40,
            child: Container(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    state,
                    style: TextStyle(
                      color: kTextColor.withOpacity(.4),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                      color: kTextColor.withOpacity(.65),
                    ),
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
