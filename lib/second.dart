import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutteruipractise/tabs/firstpage.dart';
import 'package:flutteruipractise/tabs/secondpage.dart';
import 'package:flutteruipractise/tabs/thirdpage.dart';

class second extends StatefulWidget {
  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  var _currentindex = 0;
  final tabs = [
    Center(
      child: firstpage(),
    ),
    Center(
      child: secondpage(),
    ),
    Center(
      child: thirdpage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: tabs[_currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.red,
        items: [
          Icon(Icons.home),
          Icon(Icons.add_circle),
          Icon(Icons.account_circle_outlined),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
