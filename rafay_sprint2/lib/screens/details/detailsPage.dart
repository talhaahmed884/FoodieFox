import 'package:flutter/material.dart';
import 'package:sprint2/constants.dart';
import '../../models/Data.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;
  final currency;
  final List<FurtherDetail> moreDetails;
  DetailsPage(
      {this.heroTag,
      this.foodName,
      this.foodPrice,
      this.currency,
      this.moreDetails});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<SubOption> selectedItem = [];
  List<FurtherDetail> detail_items;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    detail_items = widget.moreDetails;
    selectedItem = new List<SubOption>(widget.moreDetails.length);
  }

  @override
  void incrementCounter() {
    setState(() {
      quantity++;
    });
  }

  @override
  void decrementCounter() {
    setState(() {
      quantity--;
      if (quantity < 1) {
        quantity = 1;
      }
    });
  }

  setSelectedItem(SubOption item) {
    setState(() {
      selectedItem[item.itemId] = item;
    });
  }

  List<Widget> createRadioListItems() {
    List<Widget> widgets = [];
    int index = 0;
    for (FurtherDetail det in detail_items) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Sub Heading Box
            Text(
              det.detailName,
              style: TextStyle(
                  fontFamily: 'Circular',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            // Required Box
            Container(
              width: 95.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: primary_Red.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(5),
              child: Text(
                det.isrequired,
                style: TextStyle(color: Colors.black, fontFamily: 'Circular'),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
      for (SubOption item in det.suboptions) {
        item.itemId = index;
        widgets.add(
          RadioListTile(
            value: item,
            groupValue: selectedItem[index],
            title: Text(
              item.name,
              style: TextStyle(
                fontFamily: 'Circular',
                fontSize: 15.0,
              ),
            ),
            secondary: Text(
              item.price,
              style: TextStyle(
                fontFamily: 'Circular',
                fontSize: 15.0,
              ),
            ),
            onChanged: (currentitem) {
              setSelectedItem(currentitem);
            },
            selected: selectedItem[item.itemId] == item,
            activeColor: primary_Red,
          ),
        );
      }
      index++;
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFB051),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(
                  fontFamily: 'Circular', fontSize: 18.0, color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            // This is the yellow box behined the curved white box and after the
            // app Bar
            Container(
              height: MediaQuery.of(context).size.height - 82.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            //This is the white box that contains all the details
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            //This is the circular picture
            Positioned(
              top: 25.0,
              left: (MediaQuery.of(context).size.width / 2) - 100.0,
              child: Container(
                height: 200.0,
                width: 200.0,
                margin: const EdgeInsets.only(
                  top: 5,
                  right: 20,
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.asset(
                    widget.heroTag,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //This is where all the details code is
            Positioned(
              top: 250.0,
              left: 25.0,
              right: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Food Name
                  Text(widget.foodName,
                      style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                  // Price Plus Quantity Button
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Price
                      Text(
                          ((widget.foodPrice * quantity).toString() +
                              " " +
                              widget.currency),
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: 20.0,
                              color: Colors.grey)),
                      // Line
                      Container(height: 25.0, color: Colors.grey, width: 1.0),
                      // Quantity
                      Container(
                        width: 125.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Color(0xffFFB051)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // Minus Button
                            InkWell(
                              onTap: () {
                                decrementCounter();
                              },
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xffFFB051)),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            //Text
                            Text(quantity.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Circular',
                                    fontSize: 15.0)),
                            //Plus Button
                            InkWell(
                              onTap: () {
                                incrementCounter();
                              },
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xffFFB051),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // Container containing sub items
                  SizedBox(height: 20.0),
                  Container(
                    height: MediaQuery.of(context).size.height - 530.0,
                    child: ListView(children: createRadioListItems()),
                  ),
                  // Add to cart Button
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
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
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Circular',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ])
        ]));
  }
}
