import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutteruipractise/register.dart';
import 'package:flutteruipractise/second.dart';

class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  var _passwordVisible;
  String email;
  String password;
  User user;

  @override
  void initState() {
    _passwordVisible = false;
    getUser();

    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => second()));
    } else {
      print('user not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    margin: EdgeInsets.only(top: 80, left: 10, right: 10),
                    child: TextField(
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
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextField(
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
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) {
                        print('you clicked login');
                        // Navigator.of(context).pushReplacementNamed('/homepage');
                        print(
                            'XXXXXXXXXXXXX XXXXxxxxxxxxxxxxxxSuccccccesfull xxxxxxxxxxxxxxxxxxXXXXXXXXXXXXXXXXXXXXXXXXX');
                        print('you clicked login button');
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/homepage');
                      });

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => second()));
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didnt Have an Account?  ',
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('you clicked Register Button');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => register()));
                          },
                          child: Container(
                              child: Text(
                            'Register Here',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getUser() async {
   
    user = FirebaseAuth.instance.currentUser;
  }
}
