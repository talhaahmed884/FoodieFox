import 'package:flutter/material.dart';
import '../../constants.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary_Red,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: bg_Color,
                backgroundImage:
                    AssetImage("assets/icons/displayPlaceHolder.png"),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rafay Rashed',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text('Active Status',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(element['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Settings',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log out',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
