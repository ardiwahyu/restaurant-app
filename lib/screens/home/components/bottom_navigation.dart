import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentState = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: FancyBottomNavigation(
            tabs: [
              TabData(iconData: Icons.home, title: "Home"),
              TabData(iconData: Icons.search, title: "Search"),
              TabData(iconData: Icons.fastfood, title: "Food"),
              TabData(iconData: Icons.notifications, title: "Notifications"),
            ],
            onTabChangedListener: (position) {
              setState(() {
                currentState = position;
              });
            }),
      ),
    );
  }
}
