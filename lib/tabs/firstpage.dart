import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  String useruid;
  var Data;
  User user;
  Colors like;
  bool likes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    // getData();
    print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    print(useruid);
    print('ppppppppppppppppppppppppppp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: Data.data.snapshots(),
        ),
      ),
    );
  }

  getUser() async {
    user = FirebaseAuth.instance.currentUser;

    setState(() {
      useruid = user.uid;
    });

    print(useruid);
    Data = FirebaseFirestore.instance
        .collection('AllUsers')
        // .document(useruid)
        // .collection('userimage')
        .snapshots();
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
  }

  // getData() async {
  //   print('yyyyyyyyyyyyyyyyyyyyyyyyyy');
  //   Data = Firestore.instance
  //       .collection('UserGraphics')
  //       .document(useruid)
  //       .collection('userimage')
  //       .snapshots();
  //   print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
  // }
}
