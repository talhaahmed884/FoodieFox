import 'package:flutter/material.dart';
import 'package:foodiefox_customer/ui/Story/Story.dart';
import 'package:foodiefox_customer/ui/Story/components/data.dart';
import 'package:foodiefox_customer/ui/components/constants.dart';

class Category extends StatelessWidget {
  final String title;
  final String image;
  final Function press;

  const Category({
    Key key,
    this.title,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            // Rounded Card
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(
                left: 25,
                top: 15,
                right: 0,
                bottom: 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
              ),
            ),
            // Icon
            IconButton(
              icon: Image.asset(image),
              iconSize: 45.0,
              padding: const EdgeInsets.only(
                left: 27,
                top: 15,
                right: 0,
                bottom: 0,
              ),
              onPressed: () {
                if (title.compareTo("Vibe Check") == 0) {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => StoryScreen(stories: stories)));
                }
              },
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 22, bottom: 0, right: 0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: kTextColor.withOpacity(0.9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
