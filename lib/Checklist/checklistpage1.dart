import 'package:flutter/material.dart';
import 'package:project_bin/Widget-Other/BottomBar.dart';
import 'package:project_bin/Widget-Other/Drawer.dart';

class Checklist1 extends StatefulWidget {
  @override
  _Checklist1State createState() => _Checklist1State();
}

class _Checklist1State extends State<Checklist1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawerEnableOpenDragGesture: false,
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: DrawMenu1(),
      ),
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Builder(
                builder: (context) => IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                    ))),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Builder(
                builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ))),
          )
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'ขยะลุ้นทอง',
          style: TextStyle(
              fontFamily: 'Kanit',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor: Colors.lightGreen.shade800,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
