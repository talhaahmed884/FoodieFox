import 'package:flutter/material.dart';
import 'search_box.dart';
import 'categories.dart';
import 'restaurant_page.dart';
import 'constants.dart';

class Body extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Body> {
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
                      fontFamily: 'mont'),
                ),
              ),
            ),
            SearchBox(
              onChanged: (value) {},
            ),
            Categories(),
            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Rated",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Go check these place out",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 20),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              height: 320,
                              padding: EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: ColorVariety1,
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        offset: Offset(0, 10),
                                        blurRadius: 0,
                                        color: ColorVariety1.withOpacity(0.4))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/icons/restaurant_placeholder.png"))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Burning Brownee",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Text(
                                        " 250 Ratings",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Lorem ipsum is a dummy text used for printing",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 165,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: ColorVariety2,
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 0,
                                            offset: Offset(0, 10),
                                            blurRadius: 0,
                                            color:
                                                ColorVariety2.withOpacity(0.4))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/icons/restaurant_placeholder.png"))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Ginyaki",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height: 145,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          color: ColorVariety3,
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 0,
                                                offset: Offset(0, 10),
                                                blurRadius: 0,
                                                color:
                                                    ColorVariety3.withOpacity(
                                                        0.4))
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/icons/restaurant_placeholder.png"))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Roasters",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "All Restaurants",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 0.5,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      //  List of all restaurants
                      SizedBox(
                        height: 20,
                      ),
                      placesWidget("hotel1", "Monal"),
                      SizedBox(
                        height: 20,
                      ),
                      placesWidget("hotel2", "Yums"),
                      SizedBox(
                        height: 20,
                      ),
                      placesWidget("hotel3", "Asian Wok"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row placesWidget(String img, String name) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("assets/icons/restaurant_placeholder.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "Lorem ipsum sits dolar amet is for publishing",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: openHotelPage,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: kPrimaryColor),
            child: Text(
              "Order Now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  void openHotelPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RestaurantPage()));
  }
}

// This code was for the restaurant cards saved as a backup here
/*
  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                RestaurantCard(
                  title: "restaurant_placeholder Pakistan",
                  state: "Open",
                  image: "assets/icons/restaurant_placeholder.png",
                  description:
                      "If you're loving it too head over to the nearest branch of your favorite fast food, restaurant_placeholder",
                ),
                RestaurantCard(
                  title: "KFC Pakistan",
                  state: "Open",
                  image: "assets/icons/restaurant_placeholder.png",
                  description:
                      "Its finger licking good, head over to the nearest branch of your favorite fast food, KFC",
                ),
                RestaurantCard(
                  title: "Subway Pakistan",
                  state: "Open",
                  image: "assets/icons/restaurant_placeholder.png",
                  description:
                      "Eat Fresh with subway, head over to the nearest branch of your favorite fast food, Subway",
                ),
                // RestaurantCard(),
                SizedBox(width: 20),
              ]),
            ),
          
*/
