import 'package:flutter/material.dart';
import 'package:foodiefox/ui/components/search_box.dart';
import 'package:foodiefox/constants.dart';
import 'package:foodiefox/ui/screens/home/components/categories.dart';
import 'package:foodiefox/ui/screens/home/components/foxpick_card.dart';
import 'components/cards.dart';
import 'package:foodiefox/models/Data.dart';
import '../menu/menu-page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)
          ..rotateY(isDrawerOpen ? -0.5 : 0),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: bg_Color,
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            });
          },
          child: Column(
            children: [
              // App Bar
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Menu Box
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 35,
                            margin: const EdgeInsets.only(
                              left: 6,
                              top: 8,
                              right: 0,
                              bottom: 0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      1, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          isDrawerOpen
                              ? IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      scaleFactor = 1;
                                      isDrawerOpen = false;
                                    });
                                  },
                                )
                              : IconButton(
                                  icon: Icon(Icons.menu),
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 230;
                                      yOffset = 150;
                                      scaleFactor = 0.6;
                                      isDrawerOpen = true;
                                    });
                                  }),
                        ],
                      ),
                      // Location
                      Column(
                        children: [
                          Text('Location'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: primary_Yellow,
                              ),
                              Text('Islamabad'),
                            ],
                          ),
                        ],
                      ),
                      // Display
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 35,
                            margin: const EdgeInsets.only(
                              left: 6,
                              top: 8,
                              right: 0,
                              bottom: 0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primary_Yellow,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      1, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            // iconSize: 40.0,
                            icon: Image.asset(
                                "assets/icons/displayPlaceHolder.png"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ]),
              ),
              // Welcome Text
              SizedBox(height: 15),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 0, left: 22, bottom: 0, right: 0),
                      child: Text(
                        "Hi, Rafay",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 22, bottom: 0, right: 0),
                      child: Text(
                        "Where do you want\nto hangout today?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Search Box
              SizedBox(height: 10),
              SearchBox(
                onChanged: (value) {},
              ),
              SizedBox(height: 10),
              // Categories
              Column(
                children: [
                  Row(children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 0, left: 22, bottom: 0, right: 0),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: kTextColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  // SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Category(
                        title: "Cafe",
                        image: "assets/icons/cafe.png",
                      ),
                      Category(
                        title: "Restaurant",
                        image: "assets/icons/restaurant.png",
                      ),
                      Category(
                        title: "Vibe Check",
                        image: "assets/icons/vibe.png",
                      ),
                      Category(
                        title: "Hot Now",
                        image: "assets/icons/hot.png",
                      )
                    ],
                  ),
                ],
              ),
              // Fox Picks
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fox Picks Text
                    Row(children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Fox Picks",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: kTextColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    // Restaurant Card
                    SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int index = 0; index < 3; index++)
                            InkWell(
                              onTap: () => openMenuPage(demoRestaurants[index]),
                              child: FoxPickCard(
                                  title: demoRestaurants[index].restaurant_name,
                                  status: demoRestaurants[index].timings,
                                  image: demoRestaurants[index].res_image),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // New Deals
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // New Deals Text
                    Row(children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "New Deals",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: kTextColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    // Restaurant Card
                    SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int index = demoRestaurants.length - 1;
                              index > demoRestaurants.length - 4;
                              index--)
                            InkWell(
                              onTap: () => openMenuPage(demoRestaurants[index]),
                              child: Cards(
                                title: demoRestaurants[index].restaurant_name,
                                image: demoRestaurants[index].res_image,
                                box_width: 0.6,
                                box_height: 200,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // All Restaurants
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // All Restaurants Text
                    Row(children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "All Restaurants",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: kTextColor.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    // Big Restaurant Card
                    SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 20),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          for (int index = 0;
                              index < demoRestaurants.length;
                              index++)
                            InkWell(
                              onTap: () => openMenuPage(demoRestaurants[index]),
                              child: Cards(
                                title: demoRestaurants[index].restaurant_name,
                                image: demoRestaurants[index].res_image,
                                box_width: 1.0,
                                box_height: 230,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openMenuPage(Fox_Restaurant _restaurant) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RestaurantPage(
                  selected_restaurant: _restaurant,
                )));
  }
}
