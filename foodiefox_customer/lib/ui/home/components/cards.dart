import 'package:flutter/material.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';

class Cards extends StatelessWidget {
  final String title;
  final String image;
  final double box_width;
  final double box_height;
  final Function press;

  const Cards({
    Key key,
    this.title,
    this.image,
    this.box_width,
    this.box_height,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * box_width,
        height: box_height,
        margin: const EdgeInsets.only(
          bottom: 15,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * box_width,
              height: (box_height - 50),
              margin: const EdgeInsets.only(
                top: 5,
                right: 20,
              ),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kTextColor.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
