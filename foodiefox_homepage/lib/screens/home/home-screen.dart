import 'package:flutter/material.dart';
import 'package:foodiefox_homepage/screens/home/components/app_bar.dart';
import 'package:foodiefox_homepage/screens/home/components/body.dart';
import 'package:foodiefox_homepage/screens/home/components/bottomNavBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Body(),
      // bottomNavigationBar: BottomNavBarV2(),
    );
  }
}
