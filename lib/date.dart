import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class date extends StatefulWidget {
  @override
  _dateState createState() => _dateState();
}

class _dateState extends State<date> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
            body: LiquidSwipe(
      pages: pages,
      fullTransitionValue: 1000,
      enableSlideIcon: true,
    )));
  }
}

final pages = [
  Container(
    color: Colors.tealAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/icon.png',
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            new Text(
              "Hi",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "It's Me",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "Janavi",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  ),
  Container(
    color: Colors.deepPurpleAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/icon.png',
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            new Text(
              "Take a",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "look at",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "Liquid Swipe",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  ),
  Container(
    color: Colors.greenAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/jaimit.png',
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            new Text(
              "I am",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "Jaimit",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  ),
];
