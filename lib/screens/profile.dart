import 'dart:developer';
import 'package:taskmanager/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  String _username = "", _userphoto = "", _usermail = "";
  ProfileState() {
    username().then((val) => setState(() {
          _username = val;
        }));
    userphoto().then((val) => setState(() {
          _userphoto = val;
        }));
    usermail().then((val) => setState(() {
          _usermail = val;
        }));
  }
  Widget build(BuildContext context) {
    return
        //debugShowCheckedModeBanner: false,
        Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Color(0xff292e4e),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 20),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(_userphoto),
                        radius: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              _username,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              _usermail,
                            ),
                          ),
                          InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "View Profile",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Organization",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Notifications",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.notifications_off),
                          title: Text("Do not disturb"),
                          trailing: Text("off"),
                        ),
                      ),
                      Divider(color: Colors.grey),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.border_all_rounded),
                          title: Text("Push"),
                          trailing: Text("Manage"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "App",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.remove_red_eye),
                          title: Text("Privacy policy"),
                        ),
                      ),
                      Divider(color: Colors.grey),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text("Terms of service"),
                        ),
                      ),
                      Divider(color: Colors.grey),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.format_align_left),
                          title: Text("Licenses"),
                        ),
                      ),
                      Divider(color: Colors.grey),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.phone_iphone),
                          title: Text("App version"),
                          trailing: Text("1.0.0"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      handleLogout(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                          child: Text("Log out",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var ts = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  Future<String> userphoto() async {
    String photo;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    photo = prefs.getString('profile');
    return photo;
  }

  Future<String> usermail() async {
    String mail;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mail = prefs.getString('mail');
    return mail;
  }

  Future<String> username() async {
    String name;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    return name;
  }

  handleLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget yesButton = FlatButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          prefs.clear();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Text("Yes"));
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Would you like to logout from Taskmanager?"),
      actions: [
        noButton,
        yesButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
