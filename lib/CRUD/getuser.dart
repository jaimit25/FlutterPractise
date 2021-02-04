import 'package:firebase_auth/firebase_auth.dart';

class getuser {
  FirebaseAuth auth;



  Future<User> getUser() async {
    auth = await FirebaseAuth.instance;
    User user;
    user = await auth.currentUser;
    return user;
  }

}
