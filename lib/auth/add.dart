import '../showlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:ui';


import '../crud.dart';

class rasika1 extends StatefulWidget {
  @override
  _rasika1state createState() => _rasika1state();
}

class _rasika1state extends State<rasika1> {
  String fullname,emailId,college,total_subjects,_password;
  bool _validate = false;
  bool _passwordVisible = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  double _boxh = 30;

  crudMethods crudObj = new crudMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('media/bg-app.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 1,
              maxChildSize: 1,
              builder: (context, scrollController){
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(top:60.0),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.create,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: _boxh),
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                controller: _displayName,
                                style: TextStyle(fontSize: 16, color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  prefixIcon: Icon(Icons.person, color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.grey[700]),
                                ),
                                keyboardType: TextInputType.text,

                              ),
                            ),
                            SizedBox(height: _boxh),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: RaisedButton(
                                        elevation: 5,
                                        onPressed: () => _pushPage(context,showList()),
                                        padding: EdgeInsets.all(15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        color: Colors.white,
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: _boxh),
                                    Container(
                                      child: RaisedButton(
                                        elevation: 5,
                                        // onPressed: () => _registerAccount(),
                                        onPressed: ()async{
                                          if(_formKey.currentState.validate()){
                                            _registerAccount();
                                          }
                                        },
                                        padding: EdgeInsets.all(15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        color: Colors.white,
                                        child: Text(
                                          'REGISTER',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }

  void _registerAccount() async {

      crudObj.addUser({
        'UID': _auth.currentUser.uid,
        'Name': _displayName.text,
      }).then((result) {
        print("User Added");
      }).catchError((e) {
        print("Error: $e");
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => showList()
      ));
    }
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

