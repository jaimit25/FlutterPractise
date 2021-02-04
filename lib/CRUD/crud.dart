

import 'package:firebase_auth/firebase_auth.dart';

class CrudOperations {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> AddData(AddValues) async {
    User user1 = await _auth.currentUser;
    return user1;
  }

  Future<String> getCurrentUID() async {
    final User user = await _auth.currentUser;
    final String uid = user.uid;
    return uid;
  }
}
