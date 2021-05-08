import 'package:flutter/material.dart';
import 'package:taskmanager/Global.dart';
import 'package:taskmanager/project_screens/project_title.dart';
import 'package:taskmanager/task_screens/task_title.dart';

class TaskList extends StatefulWidget {
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff292e4e),
          title: Row(
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
                SizedBox(width: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tasktitle()));
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
          ]),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                InkWell(
                  child: ListTile(
                    leading: Icon(Icons.arrow_drop_down),
                    trailing: IconButton(
                        icon: Icon(Icons.more_horiz), onPressed: () {}),
                    title: Text(
                      "New",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )));
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
