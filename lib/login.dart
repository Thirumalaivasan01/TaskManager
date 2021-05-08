import 'package:flutter/material.dart';
//import 'package:taskmanager/googlesignin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  GoogleSignInAccount _currentUser;
  var mail, profile, name, mobile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Color(0xff292e4e),
            title: Center(child: Text('SIGN IN'))),
        body: Center(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    /*return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          RaisedButton(
            onPressed: _handleSignOut,
            child: Text('SIGN OUT'),
          )
        ],
      ); 
    } else {*/
    return SingleChildScrollView(
      child: Container(
        //color: Color(0xff292e4e),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Icon(
              Icons.person_outline, //Icons.person,
              size: 180,
              color: Colors.black,
            )),
            SizedBox(height: 90),
            Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                      highlightElevation: 0.0,
                      splashColor: Colors.white,
                      highlightColor: Color(0xfff96060),
                      elevation: 0.0,
                      color: Color(0xfff96060),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        "Sign in with Google",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        getSignIn();
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        mail = _currentUser.email;
        profile = _currentUser.photoUrl;
        name = _currentUser.displayName;
      });
      print(mail);
      print(name);
    } catch (error) {
      print(error);
    }
  }

  Future<void> getSignIn() async {
    await _googleSignIn.signIn().whenComplete(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        mail = _currentUser.email;
        profile = _currentUser.photoUrl;
        name = _currentUser.displayName;
        prefs.setString('mail', _currentUser.email);
        prefs.setString('profile', _currentUser.photoUrl);
        prefs.setString('name', _currentUser.displayName);
      });
      print(mail);
      print(name);

      //_signupFormApiCall();
      if (mail != null) {
        setState(() {
          prefs.setBool('firstTime', true);
        });
        print(prefs.getBool('firstTime'));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  List lis = [];
  var a;
  var sessionToken = '';
  Future<http.Response> _signupFormApiCall() async {
    //signup form
/*
    Map data = {
      'name': name,
      'mobile': '9080517780',
      'homeLatitude': '',
      'homeLongitude': '',
      'email': mail,
      'profileUrl': profile,
      'firebaseToken': '12334',
      'imei': '123445',
    };
    var response = await http.post('http://localhost/HR/api/v1/vcmp',
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: data,
        encoding: Encoding.getByName("gzip"));

    print('result');
    sessionToken = json.decode(response.body)['deviceToken'];
    print(sessionToken);*/
  }
}
