import 'package:e_app/LogInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffff2fc3), title: Text("Home"),

        //create logout
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                logOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LogInScreen()));
              },
              icon: Icon(Icons.person),
              label: Text("Log Out"))
        ],
      ),
    );
  }
}
