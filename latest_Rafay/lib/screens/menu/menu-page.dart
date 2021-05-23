import 'package:flutter/material.dart';
import 'package:sprint2/screens/checkout/checkout_screen.dart';
import '../../constants.dart';
import 'package:sprint2/constants.dart';
import '../../models/Data.dart';
import '../details/detailsPage.dart';

class RestaurantPage extends StatelessWidget {
  final Fox_Restaurant selected_restaurant;
  const RestaurantPage({
    Key key,
    this.selected_restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Circular"),
      home: restaurantPage(restaurant: selected_restaurant),
    );
  }
}

// ignore: camel_case_types
class restaurantPage extends StatefulWidget {
  final Fox_Restaurant restaurant;
  const restaurantPage({
    Key key,
    this.restaurant,
  }) : super(key: key);

  @override
  _restaurantPageState createState() => _restaurantPageState();
}

class _restaurantPageState extends State<restaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFB051),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              //Container for the restaurant image
              Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(widget.restaurant.res_image),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.25), BlendMode.dstATop),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 10.0,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  // This Widget contains the buttons to take you to the review
                  // page
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      right: 10.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        // Add Code Here
                      },
                      // Container for making the red box, for the button
                      child: Container(
                        width: 75.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          color: primary_Red.withOpacity(0.8),
                        ),
                        padding: EdgeInsets.only(top: 10),
                        //Text --> Reviews
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Circular',
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  top: 100.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.restaurant.restaurant_name,
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.restaurant.location,
                        style: TextStyle(
                            fontFamily: 'Circular',
                            fontSize: 15.0,
                            color: Colors.grey))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 220),
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: MediaQuery.of(context).size.height - 400.0,
                          child: ListView(children: [
                            for (var i = 0;
                                i < widget.restaurant.menu_items.length;
                                i++)
                              _buildFoodItem(
                                  widget.restaurant.menu_items[i].images,
                                  widget.restaurant.menu_items[i].nameOfProduct,
                                  widget.restaurant.menu_items[i].description,
                                  widget.restaurant.menu_items[i].price,
                                  'R.s',
                                  widget.restaurant.menu_items[i]
                                      .further_details),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0)),
                              color: primary_Yellow),
                          height: 50.0,
                          child: Center(
                            child: Text('Check Out',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Circular',
                                  fontSize: 18,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String foodDesc,
      double price, String currency, List<FurtherDetail> _furtherDetails) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                    heroTag: imgPath,
                    foodName: foodName,
                    foodPrice: price,
                    currency: currency,
                    moreDetails: _furtherDetails,
                  )));
        },
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(foodName,
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold)),
                      Text(foodDesc,
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: 15.0,
                              color: Colors.grey)),
                      SizedBox(height: 15),
                      Text(
                        price.toString(),
                        style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    margin: const EdgeInsets.only(
                      top: 5,
                      right: 20,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        imgPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 20,
        // )
      ),
    );
  }

  // void openCartPage() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => CartPage()));
  // }

}
