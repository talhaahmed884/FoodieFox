import 'package:flutter/material.dart';

import '../../../constants.dart';

class FoxPickCard extends StatelessWidget {
  final String title;
  final String status;
  final String image;
  final Function press;

  const FoxPickCard({
    Key key,
    this.title,
    this.status,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 270,
      margin: const EdgeInsets.only(
        top: 5,
        right: 20,
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: primary_Yellow,
          boxShadow: [
            BoxShadow(
              color: primary_Yellow.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(1, 10), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: ClipOval(
              child: Image.asset(
                image,
                height: 145,
                width: 145,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              for (var i = 0; i < 5; i++)
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 17,
                )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            status,
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ],
      ),
    );
  }
}
