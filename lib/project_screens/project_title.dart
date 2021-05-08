import 'package:flutter/material.dart';
import 'package:taskmanager/Global.dart';
import 'package:taskmanager/project_screens/view_types/board.dart';
import 'package:taskmanager/project_screens/view_types/about.dart';
import 'package:taskmanager/project_screens/view_types/calendar.dart';
import 'package:taskmanager/project_screens/view_types/progress.dart';
import 'package:taskmanager/project_screens/view_types/list.dart';
import 'package:flutter/cupertino.dart';

class Projecttitle extends StatefulWidget {
  ProjecttitleState createState() => ProjecttitleState();
}

class ProjecttitleState extends State<Projecttitle> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Cup ertinoScaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
          IconButton(
            icon: Icon(
              Icons.star_outline_rounded,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.share_outlined,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
              onPressed: () {
                morePressed();
              }),
        ]),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.list_rounded,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius: new BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    Text(
                      Global.projectname,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Public Project",
                    ),
                  ],
                ))),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      Global.viewtype = "List";
                    });
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => List()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    trailing: Global.viewtype == "List"
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    title: Text(
                      "List",
                    ),
                  ),
                ),
                Divider(color: Colors.grey),
                InkWell(
                  onTap: () {
                    setState(() {
                      Global.viewtype = "Board";
                    });
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Board()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.table_chart_outlined),
                    trailing: Global.viewtype == "Board"
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    title: Text(
                      "Board",
                    ),
                  ),
                ),
                Divider(color: Colors.grey),
                InkWell(
                  onTap: () {
                    setState(() {
                      Global.viewtype = "Calendar";
                    });
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calendar()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.calendar_today_rounded),
                    trailing: Global.viewtype == "Calendar"
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    title: Text(
                      "Calendar",
                    ),
                  ),
                ),
                Divider(color: Colors.grey),
                InkWell(
                  onTap: () {
                    setState(() {
                      Global.viewtype = "Progress";
                    });
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Progress()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.upgrade),
                    trailing: Global.viewtype == "Progress"
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    title: Text(
                      "Progress",
                    ),
                  ),
                ),
                Divider(color: Colors.grey),
                InkWell(
                  onTap: () {
                    setState(() {
                      Global.viewtype = "About";
                    });

                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.info_outline),
                    trailing: Global.viewtype == "About"
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                    title: Text(
                      "About",
                    ),
                  ),
                ),
              ]),
            ),
          ],
        )),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RawMaterialButton(
                      fillColor: Colors.grey[300],
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ]),
          ),
        ),
      ),
    );
  }

  morePressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
            )),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                child: Text("More"),
                padding: EdgeInsets.only(left: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 45,
              child: InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      Icon(Icons.lock_outline),
                      SizedBox(width: 15),
                      Text("Make private to members")
                    ],
                  )),
            ),
            Divider(color: Colors.grey),
            Container(
              height: 45,
              child: InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      Icon(Icons.create),
                      Text("Edit project name"),
                      SizedBox(width: 15),
                    ],
                  )),
            ),
            Divider(color: Colors.grey),
            Container(
              height: 45,
              child: InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      DecoratedBox(
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.indigo,
                            borderRadius:
                                new BorderRadius.all(Radius.circular(15))),
                      ),
                      SizedBox(width: 15),
                      Text("Make private to members")
                    ],
                  )),
            ),
            Divider(color: Colors.grey),
            Container(
              height: 45,
              child: InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      Icon(
                        Icons.link,
                        size: 20,
                      ),
                      SizedBox(width: 15),
                      Text("Copy URL")
                    ],
                  )),
            ),
            Divider(color: Colors.grey),
            Container(
              height: 45,
              child: InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      Icon(
                        Icons.archive_outlined,
                        size: 20,
                      ),
                      SizedBox(width: 15),
                      Text("Archive project")
                    ],
                  )),
            ),
            Divider(color: Colors.grey),
            Container(
              height: 45,
              child: InkWell(
                  onTap: null,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Delete project",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
