import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Noti extends StatefulWidget {
  NotiState createState() => NotiState();
}

class NotiState extends State<Noti> {
  String _firstname = "";
  NotiState() {
    firstname().then((val) => setState(() {
          _firstname = val;
        }));
  }
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  Future<String> firstname() async {
    String fname;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fname = prefs.getString('name');
    List<String> arr = fname.split(" ");
    fname = arr[0];
    return fname;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        backgroundColor: Color(0xff292e4e),
        actions: <Widget>[
          IconButton(
            onPressed: () => morePressed(),
            icon: Icon(Icons.more_vert),
          ), //Icon(Icons.search),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                // width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.only(left: 10, top: 0, right: 100),
                child: Text(
                  greeting() + "\n" + _firstname + "!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              /*Container(
                width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.only(left: 10, top: 0),
                child: Text(
                  _firstname + "!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),*/
              SizedBox(width: 20),
              Container(
                height: 150,
                width: 150,
                child: DecoratedBox(
                  child: Icon(Icons.notifications_none, size: 100),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                child: Text('No Notifications',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Column(
                children: [
                  Container(
                    child: Text('You have no',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                  Container(
                    child: Text('new Notification',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xfff96060),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            SizedBox(height: 25),
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
                leading: Icon(Icons.compare_arrows),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Swipe actions",
                ),
              ),
            ),
            Divider(color: Colors.grey),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "View Archive",
                ),
              ),
            ),
            Divider(color: Colors.grey),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.cleaning_services),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Archive all",
                ),
              ),
            ),
            Divider(color: Colors.grey),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.chevron_right_sharp),
                title: Text(
                  "Notification Settings",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
