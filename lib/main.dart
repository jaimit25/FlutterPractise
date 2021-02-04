import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutteruipractise/register.dart';
import 'package:flutteruipractise/second.dart';
import 'package:flutteruipractise/showlist.dart';
import 'auth/add.dart';
import 'first.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Practise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: first(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new MyApp(),
        '/loginpage': (BuildContext context) => new first(),
        '/registerpage': (BuildContext context) => new register(),
        '/homepage': (BuildContext context) => new second(),
        '/add': (BuildContext context) => new rasika1(),
        '/show': (BuildContext context) => new showList(),
      },
    );
  }
}
