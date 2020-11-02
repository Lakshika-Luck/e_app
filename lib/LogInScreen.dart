import 'package:flutter/material.dart';
import 'ForgotScreen.dart';
import 'SignUpScreen.dart';
import 'HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LogInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInScreenState();
  }
}

class _LogInScreenState extends State<LogInScreen> {
  String email = "", password = "";
  var _formKey = GlobalKey<FormState>();

  static FirebaseAuth auth = FirebaseAuth.instance;
  Future<String> logIn() async {
    String user = (await auth.signInWithEmailAndPassword(
            email: email.trim(), password: password))
        .toString();
    return user;
  }

  @override
  void initState() {
    super.initState();
    Future(() async {
      if (await auth.currentUser() != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000725),
        body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 180,
                  //color: Color(0xffff2fc3),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Log In ",
                        style: TextStyle(
                            color: Color(0xff000725),
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Text(
                        "Welcome to Your Online Library !",
                        style: TextStyle(
                            color: Color(0xff000725),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ]),
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(150)),
                    color: Color(0xffff2fc3),
                  ),
                ),
                Theme(
                  data: ThemeData(hintColor: Colors.blue),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your email";
                        } else {
                          email = value;
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                      ),
                    ),
                  ),
                ),
                Theme(
                  data: ThemeData(hintColor: Colors.blue),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                    child: TextFormField(
                      obscureText: true,
                      autocorrect: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "please enter your password";
                        } else {
                          password = value;
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Color(0xffff2fc3), width: 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotScreen()));
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(color: Color(0xffff2fc3)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: RaisedButton(
                    onPressed: () {
                      logIn();
                      if (_formKey.currentState.validate()) {
                        Future<String> check = logIn();
                        if (check != null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen()));
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Color(0xffff2fc3),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Color(0xff000725),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.blue,
                ),
                /*
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: RaisedButton(
                  onPressed: () {
                    /* _GoogleSignIn();
                      if (signInState) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeScreen()));
                      }*/
                  },
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      //we need to import font awesome

                      Icon(
                        FontAwesomeIcons.google,
                        color: Color(0xff000725),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign In with Google",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff000725)),
                      )
                    ],
                  ),
                )),
                */

                /*
            Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      //we need to import font awesome

                      Icon(
                        FontAwesomeIcons.facebook,
                        color: Color(0xff000725),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign In with Facebook",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff000725)),
                      )
                    ],
                  ),
                )),

                */

                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Column(
                  children: <Widget>[
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpScreen()));
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Container(
                              width: 45,
                              height: 1,
                              color: Colors.blue,
                            )
                          ],
                        )),
                  ],
                ))
              ],
            )));
  }
}
