import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutteruipractise/second.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutteruipractise/showlist.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  var _passwordVisible;
  String email;
  String Nameuser;
  String password;
  FirebaseAuth auth;
  User user;
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formstate,
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('assets/images/loginpage.jpg'),
          //       fit: BoxFit.cover),
          // ),
          child: ListView(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 80),
                        height: 150,
                        width: 150,
                        child: Image(
                          image: AssetImage('assets/images/icon.png'),
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            hintText: 'Name',
                            border: InputBorder.none),
                        onChanged: (value) {
                          Nameuser = value;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: _emailController,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            hintText: 'Enter Your Gmail',
                            border: InputBorder.none),
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) => EmailValidator.validate(email)
                            ? null
                            : "Invalid Email Address",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          hintText: 'Password',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          Pattern pattern =
                              r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';

                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return "Invalid Passsword";
                          } else
                            return null;
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        print('you clicked Create Account button');
                        if (formstate.currentState.validate()) {
                          registeraccount();
                        }

                        // FirebaseAuth.instance
                        //     .createUserWithEmailAndPassword(
                        //   email: email,
                        //   password: password,
                        // )
                        //     .then((SignedInUser) {
                        //   FirebaseUser fuser = SignedInUser.user;
                        //   Firestore.instance
                        //       .collection('/users')
                        //       .document(fuser.uid)
                        //       .setData({
                        //     'photo': 'UserPhoto',
                        //     'Number': 'Number',
                        //     'name': Nameuser,
                        //     'email': email,
                        //     'uid': SignedInUser.user.uid,
                        //   });

                        //   Fluttertoast.showToast(
                        //     msg: "Account Created",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.BOTTOM,
                        //     timeInSecForIosWeb: 2,
                        //     backgroundColor: Colors.black45,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0,
                        //   );

                        // }).catchError((e) {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        margin: EdgeInsets.only(
                            top: 70, left: 10, right: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.red,
                        child: Center(
                          child: Text(
                            'Login Button',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ),
                        height: 60,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registeraccount() async {
    User user = (await auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;
    if (user != null) {
      if (!(user == null)) {
        await user.sendEmailVerification();
      }

      await FirebaseFirestore.instance.collection('/users').doc(user.uid).set({
        'uid': user.uid,
        'Name': Nameuser,
        'Email': _emailController.text,
        'Password': _passwordController.text,
        'Photo':
            'https://st2.depositphotos.com/3261171/8636/i/950/depositphotos_86365582-stock-photo-nice-girl-having-a-walk.jpg'
      }).then((result) {
        print("User Added");
      }).catchError((e) {
        print("Error: $e" + "!");
      });

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => showList()));
    } else {
      print("User not registered");
    }
  }
}
