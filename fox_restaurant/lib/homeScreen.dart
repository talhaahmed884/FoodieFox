import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'configuration.dart';
import 'model/Data.dart';
import 'screen2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double totalCost = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // Menu + Location + Display
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Column(
                    children: [
                      Text('Location'),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primaryGreen,
                          ),
                          Text('Islamabad'),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar()
                ],
              ),
            ),
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text('Search Here...'),
                  Icon(Icons.settings)
                ],
              ),
            ),
            // Categories
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 25),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      1, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            categories[index]['icon'],
                            size: 50,
                            color: primary_Red,
                          ),
                        ),
                        Text(categories[index]['name'])
                      ],
                    ),
                  );
                },
              ),
            ),
            // Has the order boxes
            Column(
              children: [
                for (int i = 0; i < demoorder.length; i++)
                  InkWell(
                    onDoubleTap: () => openOrderPage(demoorder[i]),
                    child: Dismissible(
                      key: Key(demoorder[i].order_id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          demoorder.removeAt(i);
                        });
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: primary_Red.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [Spacer(), Icon(Icons.delete)],
                        ),
                      ),
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  // White Box with Desc
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 45, bottom: 10, left: 145),
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: shadowList,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                    ),
                                    padding: EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Order ID: " +
                                                demoorder[i].order_id,
                                            style: TextStyle(
                                              fontFamily: "Circular",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Order Items: ",
                                            style: TextStyle(
                                              fontFamily: "Circular",
                                              fontSize: 15,
                                            ),
                                          ),
                                          for (int j = 0;
                                              j <
                                                  demoorder[i]
                                                      .order_items
                                                      .length;
                                              j++)
                                            Text(
                                              demoorder[i]
                                                  .order_items[j]
                                                  .nameOfProduct,
                                              style: TextStyle(
                                                fontFamily: "Circular",
                                                fontSize: 13,
                                              ),
                                            ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Total: " +
                                                demoorder[i].totalCost +
                                                " R.s",
                                            style: TextStyle(
                                                fontFamily: "Circular",
                                                fontSize: 13,
                                                color: black.withOpacity(0.6)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Tall box with picture
                                  Container(
                                    width: 150,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: primary_Red,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: 40),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: Image.asset(
                                        demoorder[i].res_image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  void openOrderPage(Fox_Order fox_order) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderPage(
                  selected_Order: fox_order,
                )));
  }
}
