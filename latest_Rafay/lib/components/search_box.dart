import 'package:flutter/material.dart';
import 'package:sprint2/models/Data.dart';
import 'package:sprint2/screens/home/components/cards.dart';
import 'package:sprint2/screens/menu/menu-page.dart';
import '../constants.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: SearchRestaurant());
      },
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: primary_Yellow,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: SearchRestaurant());
                }),
            SizedBox(
              width: 10,
            ),
            Text(
              "Search Here",
              style: TextStyle(
                  color: kTextLightColor, fontSize: 15, fontFamily: "Circular"),
            )
          ],
        ),
      ),
    );
  }
}

class SearchRestaurant extends SearchDelegate<Fox_Restaurant> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Fox_Restaurant> mylist = query.isEmpty
        ? demoRestaurants
        : demoRestaurants
            .where((p) => p.restaurant_name.startsWith(query))
            .toList();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Results
            Row(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Search Results",
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
                  for (int index = 0; index < mylist.length; index++)
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantPage(
                                  selected_restaurant: mylist[index]))),
                      child: Cards(
                        title: mylist[index].restaurant_name,
                        image: mylist[index].res_image,
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
    );

    // return Center(
    //   child: Text(query),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //-----------
    final List<Fox_Restaurant> mylist = query.isEmpty
        ? demoRestaurants
        : demoRestaurants
            .where((p) => p.restaurant_name.startsWith(query))
            .toList();

    return mylist.isEmpty
        ? Text(
            "No Results Found...",
            style: TextStyle(fontSize: 15, color: black.withOpacity(0.6)),
          )
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Fox_Restaurant listItem = mylist[index];
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listItem.restaurant_name,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        listItem.location,
                        style: TextStyle(
                            fontSize: 13, color: black.withOpacity(0.75)),
                      ),
                    ]),
              );
            },
          );
  }
}
