import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('List of all restaurants displayed here'),
    ));
  }
}
