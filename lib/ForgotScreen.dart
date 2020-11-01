import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotScreen();
  }
}

class _ForgotScreen extends State<ForgotScreen> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000725),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            left: 20,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "We will send you a link to reset your password... ",
                style: TextStyle(color: Color(0xffffffff), fontSize: 20),
              ),
              Theme(
                data: ThemeData(hintColor: Colors.blue),
                child: Padding(
                  padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter your email";
                      } else {
                        email = value;
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
