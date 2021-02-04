import 'package:flutteruipractise/Model/userprofile.dart';
import 'package:flutteruipractise/Model/userprofile.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  String uid;
  String random;
  String imgurl;
  String Caption;
  userprofile localuser;
  User user;

  @override
  void initState() {
    super.initState();
    // getUser();
    getCurrentUser();
    random = randomString(100);
    print(random);
  }

  @override
  Widget build(BuildContext context) {
    return PageToDisplay();
  }

  UploadImage() async {
    var doc = FirebaseFirestore.instance
        .collection('AllUsers')
        .doc(uid)
        .collection('userimage')
        .add({
      'Users': 0,
      'Caption': 'hi',
      'imgUrl': imgurl == null
          ? 'https://st2.depositphotos.com/3261171/8636/i/950/depositphotos_86365582-stock-photo-nice-girl-having-a-walk.jpg'
          : imgurl,
      'likes': 0,
      'StringExtra': '',
      'IntExtra': ''
    });
    var mixdoc = FirebaseFirestore.instance.collection('UserGraphics')
        // .document(uid)
        // .collection('userimage')
        .add({
      'Name': localuser.Name,
      'Caption': '',
      'imgUrl': imgurl == null
          ? 'https://st2.depositphotos.com/3261171/8636/i/950/depositphotos_86365582-stock-photo-nice-girl-having-a-walk.jpg'
          : imgurl,
      'likes': false,
      'StringExtra': '',
      'IntExtra': ''
    });
  }

  getCurrentUser() async {
    var user1 = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = user1;
    });
    final uid = user.uid;
    print(uid);
    var doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    print(doc.data);

    setState(() {
      localuser = userprofile.fromDocument(doc);
    });
    print(localuser.Email);
    print('this method has run');
  }

  // getUser() async {
  //   FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //   uid = user.uid;
  // }

  Widget PageToDisplay() {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            child: RaisedButton(
              child: Text('Click me'),
              onPressed: () {
                UploadImage();
              },
            ),
          ),
        ],
      ),
    );
  }
}
