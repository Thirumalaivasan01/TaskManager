import 'package:flutter/material.dart';
import 'package:taskmanager/new_task.dart';
import 'package:taskmanager/project_screens/project_title.dart';
import 'package:taskmanager/screens/project.dart';
import 'package:taskmanager/Global.dart';

class Projectview extends StatefulWidget {
  ProjectState createState() => ProjectState();
}

class ProjectState extends State<Projectview> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff292e4e),
        title:
            /*Container(
          child: ListTile(
            leading: Container(
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
            title: InkWell(
              child: Text(Global.projectname,
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Projecttitle()));
              },
            ),
            subtitle: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Projecttitle()));
              },
              child: Row(children: [
                Text(Global.viewtype, style: TextStyle(color: Colors.white)),
                Icon(Icons.keyboard_arrow_down),
              ]),
            ),
            trailing: Expanded(
                child: SizedBox(
              width: 30,
            )),
          ),
        ),*/
            Container(
          alignment: Alignment.centerLeft,
          child: Row(
              //width: MediaQuery.of(context).size.width,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                      Text(Global.viewtype),
                    ]),
                  ),
                ),
              ]),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: [
          IconButton(
            icon: Icon(Icons.view_stream),
            onPressed: () {
              settingPressed();
            },
          ),
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                morePressed();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateNewTaskPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xfff96060),
      ),
    );
  }

  morePressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
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
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.person_add_alt),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Add Member",
                ),
              ),
            ),
            Divider(color: Colors.grey),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.linear_scale),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Add Section",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  settingPressed() {
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
                child: Text("View settings"),
                padding: EdgeInsets.only(left: 20),
              ),
            ),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.rotate_right_rounded),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Tasks",
                ),
              ),
            ),
            Divider(color: Colors.grey),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.sort),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Sort by",
                ),
              ),
            ),
            Divider(color: Colors.grey),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.filter_alt_outlined),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Filter by",
                ),
              ),
            ),
            Divider(color: Colors.grey),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.add),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Show with",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
