import 'package:flutter/material.dart';
import 'package:foodiefox/ui/components/app_bar.dart';
import 'package:foodiefox/ui/components/body.dart';

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
