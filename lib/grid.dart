import 'package:flutter/material.dart';

class grid extends StatefulWidget {
  @override
  _gridState createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(50),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "1",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "2",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "3",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "4",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "5",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "6",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "7",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "8",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: const EdgeInsets.all(3),
                  child: Center(
                    child: const Text(
                      "9",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
