import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class crudMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addUser(userData) {
    return FirebaseFirestore.instance
        .collection('UserGraphics')
        .add(userData)
        .then((value) {
      print("UID: ${FirebaseAuth.instance.currentUser.uid}");
    }).catchError((e) {
      print(e);
    });
  }

  Future<QuerySnapshot> user() async {
    return await FirebaseFirestore.instance
        .collection('UserGraphics').get();
  }


  updateData(sDoc, newValues) {
    return FirebaseFirestore.instance
        .collection('UserGraphics')
        .doc(sDoc)
        .update(newValues)
        .catchError((e) {
      print(e);
    });
  }

  deleteUser(docId) {
    return FirebaseFirestore.instance.collection('UserGraphics').doc(docId).delete().catchError((e) => print(e));
  }

}
