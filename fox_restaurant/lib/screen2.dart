import 'package:flutter/material.dart';
import 'configuration.dart';
import 'model/Data.dart';

class OrderPage extends StatelessWidget {
  final Fox_Order selected_Order;
  const OrderPage({
    Key key,
    this.selected_Order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Circular"),
      home: _OrderPage(order: selected_Order),
    );
  }
}

class _OrderPage extends StatefulWidget {
  final Fox_Order order;
  const _OrderPage({
    Key key,
    this.order,
  }) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<_OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFB051),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              //Container for the Order image
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(widget.order.res_image),
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
                    Text(widget.order.order_id,
                        style: TextStyle(
                            fontFamily: 'Circular',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 150),
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
                                i < widget.order.order_items.length;
                                i++)
                              _buildFoodItem(
                                  widget.order.order_items[i].images,
                                  widget.order.order_items[i].nameOfProduct,
                                  widget.order.order_items[i].description,
                                  widget.order.order_items[i].price.toString(),
                                  "R.s",
                                  widget.order.order_items[i].further_details),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 5.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => CartScreen()));
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
                            child: Text('Mark As Complete',
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
      String price, String currency, List<FurtherDetail> furtherDetails) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      for (int i = 0; i < furtherDetails.length; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(furtherDetails[i].detailName,
                                style: TextStyle(
                                    fontFamily: 'Circular',
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            Text(furtherDetails[i].price,
                                style: TextStyle(
                                    fontFamily: 'Circular',
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                          ],
                        ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
