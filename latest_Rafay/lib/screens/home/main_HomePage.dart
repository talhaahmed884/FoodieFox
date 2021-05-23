import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer-screen.dart';
import 'home-screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
