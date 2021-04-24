import 'package:flutter/material.dart';
import 'package:foodiefox_homepage/components/search_box.dart';
import 'package:foodiefox_homepage/screens/home/components/categories.dart';
import 'package:foodiefox_homepage/screens/home/components/restaurant_card.dart';
import 'package:foodiefox_homepage/screens/home/components/small_cards.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 0),
                child: Text(
                  "Simple way to find\nTasty food",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SearchBox(
              onChanged: (value) {},
            ),
            Categories(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                RestaurantCard(
                  title: "Mcdonalds Pakistan",
                  state: "Open",
                  image: "assets/icons/mcdonalds.png",
                  description:
                      "If you're loving it too head over to the nearest branch of your favorite fast food, Mcdonalds",
                ),
                RestaurantCard(
                  title: "KFC Pakistan",
                  state: "Open",
                  image: "assets/icons/mcdonalds.png",
                  description:
                      "Its finger licking good, head over to the nearest branch of your favorite fast food, KFC",
                ),
                RestaurantCard(
                  title: "Subway Pakistan",
                  state: "Open",
                  image: "assets/icons/mcdonalds.png",
                  description:
                      "Eat Fresh with subway, head over to the nearest branch of your favorite fast food, Subway",
                ),
                // RestaurantCard(),
                SizedBox(width: 20),
              ]),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Cafe's",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                SmallCard(title: "Chickachino", color_: Colors.orangeAccent),
                SmallCard(title: "Secret Sky", color_: Colors.orangeAccent),
                SmallCard(title: "The Hotspot", color_: Colors.orangeAccent),
                SizedBox(width: 20),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Popular Food',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                SmallCard(title: "FoodWay Pakistan", color_: Colors.pinkAccent),
                SmallCard(
                    title: "Cheezious Pakistan", color_: Colors.pinkAccent),
                SmallCard(
                    title: "Banu Pulao Pakistan", color_: Colors.pinkAccent),
                SmallCard(title: "Savour Pakistan", color_: Colors.pinkAccent),
                SmallCard(
                    title: "Pizza Hut Pakistan", color_: Colors.pinkAccent),
                // RestaurantCard(),
                SizedBox(width: 20),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
