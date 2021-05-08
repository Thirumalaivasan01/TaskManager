import 'package:flutter/material.dart';
import 'package:taskmanager/Global.dart';
import 'package:taskmanager/task_screens/list.dart';
import 'package:taskmanager/task_screens/calendar.dart';
import 'package:taskmanager/screens/task.dart';

class Tasktitle extends StatefulWidget {
  TasktitleState createState() => TasktitleState();
}

class TasktitleState extends State<Tasktitle> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 150, bottom: 75),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.indigoAccent,
                ),
                Text("Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text("Organization"),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Global.taskviewtype = "List";
                          });
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Task()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          trailing: Global.taskviewtype == "List"
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
                            Global.taskviewtype = "Calendar";
                          });
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TaskCalendar()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.calendar_today_rounded),
                          trailing: Global.taskviewtype == "Calendar"
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
                            Global.taskviewtype = "About";
                          });

                          Navigator.of(context).pop();
                          // Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) => About()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.info_outline),
                          trailing: Global.taskviewtype == "About"
                              ? Icon(Icons.check, color: Colors.green)
                              : null,
                          title: Text(
                            "About",
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
      bottomNavigationBar: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
            padding: EdgeInsets.all(10),
          )) /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
                fillColor: Colors.grey[300],
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                child: Center(child: Icon(Icons.close)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),*/
          ),
    );
  }
}
