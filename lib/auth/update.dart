import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../showlist.dart';
import '../crud.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  QuerySnapshot user;
  crudMethods crudObj = new crudMethods();

  String id;
  TextEditingController _displayName = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void initState() {
    // TODO: implement initState
    crudObj.user().then((QuerySnapshot results) {
      setState(() {
        user = results;
      });
      user.docs.forEach((element) {
        print(element.get("Name"));
        id = element.id;
        _displayName = TextEditingController(text: element.get("Name"));
        print(_displayName.text);

      });
    });
    super.initState();
  }

  Widget _profileText(){
    return Text(
      'PROFILE',
      style: TextStyle(
        fontSize: 30,
        letterSpacing: 1.5,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _circleAvatar(){
    return Container(
      padding: EdgeInsets.all(3),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width:5),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
  Widget _textFormField()
  {
    if(user!=null) {
      return Material(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                TextFormField(
                  controller: _displayName,
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        letterSpacing: 2,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.white30),
                ),
                SizedBox(height: 15,),

              ],
            ),
          )
      );
    }else{
      return Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitFoldingCube(
                  color: Colors.black,
                  size: 70.0,
                ),
                SizedBox(height: 40,),
                Text(
                  'LOADING...',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 10,
                  ),
                ),
              ]
          ));
    }
  }

  Widget _textFormFieldCalling(){
    return Container(
      //height:445,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _textFormField(),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            margin: EdgeInsets.only(right: 100,left: 100),
            child: RaisedButton(
              elevation: 5,
              onPressed: () => _update(),
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.black,
              child: Text(
                'UPDATE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOMEWORK MANAGER"),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      body: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        maxChildSize: 1,
        builder: (context, scrollController){
          return SingleChildScrollView(
            controller: scrollController,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CustomPaint(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  painter: HeaderCurvedContainer(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _profileText(),
                      _circleAvatar(),
                      _textFormFieldCalling(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _update() async {
    Navigator.of(context).pop();
    crudObj.updateData(id,{
      'UID': _auth.currentUser.uid,
      'Name': _displayName.text,
    }).then((result) {
      print("User Updated");
    }).catchError((e) {
      print("Error: $e");
    });

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => showList()));
  }
}
class HeaderCurvedContainer extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint paint = Paint()..color=Colors.black38;
    Path path =  Path()
      ..relativeLineTo(0, 100)
      ..quadraticBezierTo(size.width/2, 200, size.width, 100)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}