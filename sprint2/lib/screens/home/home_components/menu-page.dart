import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:sprint2/constants.dart';
import 'cart-page.dart';
import 'detailsPage.dart';

class RestaurantPage extends StatelessWidget {
  final String image;
  final String name;
  const RestaurantPage({
    Key key,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Circular"),
      home: restaurantPage(image: image, name: name),
    );
  }
}

// ignore: camel_case_types
class restaurantPage extends StatefulWidget {
  final String image;
  final String name;
  const restaurantPage({
    Key key,
    this.image,
    this.name,
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.25), BlendMode.dstATop),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0,
                    left: 10.0,
                    right: MediaQuery.of(context).size.width * 0.9),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  top: 100.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
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
                            for (var i = 0; i < 8; i++)
                              _buildFoodItem('assets/icons/foxPlaceHolder.png',
                                  'Food Item', '735 R.s')
                          ]),
                        ),
                      ),
                    ),
                    Container(
                      height: 65.0,
                      width: 100.0,
                      margin: const EdgeInsets.only(
                        top: 15,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 2), // changes position of shadow
                          ),
                        ],
                        color: Color(0xffFFB051),
                      ),
                      child: Center(
                          child: Text('Checkout',
                              style: TextStyle(
                                  fontFamily: 'Circular',
                                  color: Colors.white,
                                  fontSize: 20.0))),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      heroTag: imgPath, foodName: foodName, foodPrice: price)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Circular',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: TextStyle(
                                fontFamily: 'Circular',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                Icon(Icons.add, color: Colors.black),
              ],
            )));
  }

  void openCartPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CartPage()));
  }
}
