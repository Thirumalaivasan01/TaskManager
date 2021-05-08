import 'package:flutter/material.dart';
import 'package:taskmanager/Global.dart';
import 'package:taskmanager/project_screens/project_title.dart';

class Board extends StatefulWidget {
  BoardState createState() => BoardState();
}

class BoardState extends State<Board> {
  var columns = <Widget>[
    Column(children: [
      Container(
        color: Colors.grey,
        height: 200,
        width: 80,
      ),
    ]),
    Column(children: [
      Container(
        color: Colors.grey,
        height: 200,
        width: 80,
      ),
    ]),
    Column(
      children: [
        InkWell(
            onTap: () {},
            child: Text(
              "Add Column",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    ),
  ];

  Widget build(BuildContext context) {
    PageController pagecontroller = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff292e4e),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Projecttitle()));
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
        ),
        leading: Row(children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ]),
      ),
      body: PageView(
        controller: pagecontroller,
        children: columns,
      ),
    );
  }
}
