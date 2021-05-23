import 'package:flutter/material.dart';
import 'package:sprint2/constants.dart';
import 'package:sprint2/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
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
            child: CartCard(cart: demoCarts[index]),
          ),
        ),
      ),
    );
  }
}
