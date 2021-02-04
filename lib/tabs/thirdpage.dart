import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutteruipractise/CRUD/getuser.dart';
import 'package:flutteruipractise/ImageViewer.dart';
import 'package:flutteruipractise/Model/userprofile.dart';

import '../EditProfile.dart';

DocumentSnapshot snapshot;

class thirdpage extends StatefulWidget {
  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  // FirebaseUser user;
  FirebaseAuth _auth;
  User user;
  String test;
  var db = FirebaseDatabase.instance.reference();
  var datafromdatabase;
  String datastring;
  userprofile localuser;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    getCurrentUser();
    // retrievedata();

    // db.child("data").once().then((DataSnapshot data) async {
    //   datafromdatabase = data.value;
    //   datastring = datafromdatabase.toString();
    //   print(datafromdatabase);
    //   setState(() {
    //     datastring = data.value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Loader();
  }

  getCurrentUser() async {
    var user1 = FirebaseAuth.instance.currentUser;
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
    print(localuser.Password);
    print('this method has run');
  }

  // retrievedata() async {
  //   print('yoyoyo');
  //   var doc =
  //       await Firestore.instance.collection('users').document(user.uid).get();
  //   // doc.data;

  //   print(doc.data);
  //   print(doc);
  // }

  // Future<String> findUser() async {
  //   user = await FirebaseAuth.instance.currentUser();
  //   var uid = user.uid;
  //   return uid;
  // }

  Widget Loader() {
    return FutureBuilder(
      future:
          FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return loadingwidget();
        }
        return profilepage();
      },
    );
  }

  Widget loadingwidget() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget profilepage() {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Text(localuser.Password),
      ),
    );
  }
}
