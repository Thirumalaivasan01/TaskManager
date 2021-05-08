import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MyApp(),
    );
  });
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      color: Colors.white,
      home: new SplashScreen(),

/*routes: <String, WidgetBuilder>{
  '/RegisterPage': (BuildContext context) => new LoginPage(),
}*/
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool firstTime;
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstTime = prefs.getBool('firstTime');
    print("firstTime=" + firstTime.toString());
    var name = prefs.getString('name');

    var _duration = new Duration(seconds: 1);

    ///if (firstTime != null && firstTime == true) {
    if (firstTime == true) {
      return new Timer(_duration, navigationPageHome);
    } else {
      return new Timer(_duration, navigationPageLogin);
    }
    /* var email = prefsnote.getString('mail');
    print(email);
    return new Timer(
        _duration, email == null ? navigationPageLogin : navigationPageHome);*/
  }

  void navigationPageLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void navigationPageHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double wt = screenSize.width;
    var ts = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 2);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              color: Color(0xff292e4e),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    Text('Task Manager', style: ts.copyWith(fontSize: 28)),
                  ])))
        ],
      ),
    );
  }
}
