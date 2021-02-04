import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutteruipractise/Model/userprofile.dart';

class imageViewer extends StatefulWidget {
  @override
  _imageViewerState createState() => _imageViewerState();
}

class _imageViewerState extends State<imageViewer> {
  String Uid;
  String imageurl;
  userprofile localuser;
  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 140, left: 10, right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // color: Colors.green,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageurl),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getImage() async {
    User user = await FirebaseAuth.instance.currentUser;
    Uid = user.uid;

    var val =
        await FirebaseFirestore.instance.collection('users').doc(Uid).get();

    setState(() {
      localuser = userprofile.fromDocument(val);
      imageurl = localuser.Photo;
    });
  }
}

// Icon(Icons.arrow_back_rounded),
//           Center(
//             child: Container(
//               height: 400,
//               width: MediaQuery.of(context).size.width,
//               margin: EdgeInsets.only(left: 10, right: 10),
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 // color: Colors.green,
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(imageurl),
//                 ),
//               ),
//             ),
//           ),
