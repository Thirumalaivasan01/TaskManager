import 'package:flutter/material.dart';
import 'package:taskmanager/deleted/project_view.dart';
import 'package:taskmanager/Global.dart';
import 'package:taskmanager/project_screens/view_types/list.dart';

class Project extends StatefulWidget {
  ProjectState createState() => ProjectState();
}

class ProjectState extends State<Project> with TickerProviderStateMixin {
  TabController tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    //TODO: implement intiState
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() {
      setState(() {
        _selectedIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff292e4e),
        title: Text(
          'Projects',
        ),
        bottom: new PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TabBar(
                  isScrollable: true,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  tabs: [
                    Tab(child: Text("All")),
                    Tab(
                      child: Text("Favorites"),
                    ),
                    Tab(
                      child: Text("Recents"),
                    ),
                  ],
                  indicatorColor: Colors.white,
                  controller: tabController,
                )),
          ),
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                InkWell(
                    child: ListTile(
                      title: Text("Example"),
                      leading: Container(
                        child: Icon(
                          Icons.list_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(7)),
                        ),
                      ),
                    ),
                    onTap: () {
                      Global.projectname = "example";
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => List()));
                    }),
              ],
            ),
          ),
          //child: Text("All"),
        ),
        Center(
          child: Text("No Favorites"),
        ),
        Center(
          child: Text("No Recents"),
        ),
      ]),
      /* SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [],
            ),
          ),
        ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newproject(context);
        },
        child: Icon(Icons.post_add),
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
        //height: MediaQuery.of(context).size.height * 0.5,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
            )),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                child: Text("More"),
                padding: EdgeInsets.only(left: 0),
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
        //height: MediaQuery.of(context).size.height * 0.5,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
            )),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                child: Text("View settings"),
                padding: EdgeInsets.only(left: 10),
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

  newproject(BuildContext context) async {
    TextEditingController controller = new TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    projecttype _type;
    Widget noButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget yesButton = FlatButton(
        disabledColor: Colors.grey,
        disabledTextColor: Colors.grey[200],
        color: Colors.blue,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();

          //  Navigator.pushReplacement(
          //  context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Text("Create"));
    AlertDialog alert = AlertDialog(
      title: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: "project Title",
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey))),
      ),
      content: Container(
          height: height - 100,
          width: width - 20,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  child: Text("Layout"),
                  padding: EdgeInsets.only(left: 10),
                ),
              ),
              ListTile(
                title: const Text("List"),
                subtitle: Text("Organize your work in an itemized list"),
                leading: Radio(
                    value: projecttype.List,
                    groupValue: _type,
                    onChanged: (projecttype value) {
                      setState(() {
                        _type = value;
                      });
                    }),
              ),
              ListTile(
                  title: const Text("Board"),
                  subtitle: Text(
                      "Organize your work like sticky notes across columns"),
                  leading: Radio(
                    groupValue: _type,
                    value: projecttype.Board,
                    onChanged: (projecttype value) {
                      setState(() {
                        _type = value;
                      });
                    },
                  ))
            ],
          )),
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

enum projecttype { List, Board }
