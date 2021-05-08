import 'package:flutter/material.dart';
import 'package:taskmanager/Global.dart';
import 'package:taskmanager/project_screens/project_title.dart';

class About extends StatefulWidget {
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff292e4e),
        title: Row(
            //width: MediaQuery.of(context).size.width,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Container(
                child: Icon(
                  Icons.list_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  borderRadius: new BorderRadius.all(Radius.circular(7)),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Projecttitle()));
                },
                child: Container(
                  child: Column(children: [
                    Text(Global.projectname,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(children: [
                      Text(
                        Global.viewtype,
                        style: TextStyle(fontSize: 10),
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 15),
                    ]),
                  ]),
                ),
              ),
            ]),
        leading: Row(children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ]),
      ),
    );
  }
}
