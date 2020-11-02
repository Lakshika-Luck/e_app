import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'LogInScreen.dart';

class SplashScreen extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000725),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    MyImage(),
                    Text(
                      "EduRoom",
                      style: TextStyle(fontSize: 40, color: Color(0xffff2fc3)),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Online School For You !",
                        style:
                            TextStyle(fontSize: 30, color: Color(0xffffffff)))
                  ],
                )),
          ],
        ),
      ),
    );
  }

//navigate to the login page

  void NavigateToLogIn() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LogInScreen())));
  }

  @override
  void initState() {
    super.initState();
    NavigateToLogIn();
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage image = new AssetImage("images/logo.png");
    Image logo = new Image(
      image: image,
      width: 200,
      height: 200,
    );
    return logo;
  }
}
