import 'package:e_app/LogInScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogInScreen.dart';
import 'AdminScreen.dart';

class HomeScreen extends StatefulWidget {
  String currentEmail;
  HomeScreen(this.currentEmail);

  @override
  _HomeScreenState createState() => _HomeScreenState(currentEmail);
}

class _HomeScreenState extends State<HomeScreen> {
  String currentEmail;
  _HomeScreenState(this.currentEmail);

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    auth.signOut().then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LogInScreen()));
    });
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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 170,
              color: Color(0xff000725),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Image(
                    image: AssetImage("images/logo.jpg"),
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentEmail,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Admin CRUD"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext conext) => AdminScreen()));
              },
            ),
            ListTile(
              title: Text("Courses"),
              leading: Icon(Icons.book),
            ),
            ListTile(
              title: Text("Students"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Details"),
              leading: Icon(Icons.question_answer),
            ),
            Divider(),
            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.email),
            ),
          ],
        ),
      ),
    );
  }
}
