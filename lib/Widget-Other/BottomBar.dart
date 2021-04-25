import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      buttonBackgroundColor: Colors.orange.shade900,
      color: Colors.lightGreen.shade800,
      backgroundColor: Colors.white,
      items: [
        Icon(
          Icons.list,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.image_search,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.calendar_today_rounded,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.group_rounded,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.volunteer_activism,
          size: 30,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/SignUp');
        }
      },
    );
  }
}
