import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutteruipractise/Model/FirestoreService.dart';

class Fservice {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get Entries
  Stream<List<FirestoreService>> getEntries() {
    return _db.collection('').snapshots().map((snapshot) => snapshot.docs
        .map((doc) => FirestoreService.fromJson(doc.data()))
        .toList());
  }

  //Upsert
  Future<void> setEntry(FirestoreService service) {
    var options = SetOptions(merge: true);

    return _db.collection('').doc(service.imgUrl).set(service.toMap(), options);
  }

  //Delete
  Future<void> removeEntry(String imgUrl) {
    return _db.collection('').doc(imgUrl).delete();
  }
}
