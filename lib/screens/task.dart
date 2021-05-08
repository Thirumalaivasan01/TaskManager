import 'package:flutter/material.dart';
import 'package:taskmanager/new_task.dart';
import 'package:taskmanager/Global.dart';
import 'package:taskmanager/task_screens/task_title.dart';

class Task extends StatefulWidget {
  TaskState createState() => TaskState();
}

class TaskState extends State<Task> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff292e4e),
          title: Row(
              //width: MediaQuery.of(context).size.width,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tasktitle()));
                  },
                  child: Container(
                    child: Column(children: [
                      Text("My Tasks",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: [
                        Text(
                          Global.taskviewtype,
                          style: TextStyle(fontSize: 10),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 15),
                      ]),
                    ]),
                  ),
                ),
              ]),
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            //  backgroundImage: NetworkImage(_userphoto),
            radius: 10,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title: Text("Tasks"),
                    trailing:
                        Text("due date", style: TextStyle(color: Colors.green)),
                  )
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateNewTaskPage()));
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xfff96060),
        ),
      ),
    );
  }
}
