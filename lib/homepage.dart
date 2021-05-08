import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
//import 'package:custom_navigator/custom_navigator.dart';
//import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/screens/project.dart';
import 'package:taskmanager/screens/noti.dart';
import 'package:taskmanager/screens/task.dart';
//import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taskmanager/screens/search.dart';
import 'login.dart';
import 'screens/profile.dart';
import 'new_task.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class HomePageState extends State<HomePage> {
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  Icon _searchIcon = Icon(Icons.search);

  //final TaskList taskList = TaskList();
  String _userphoto = "";
  HomePageState() {
    userphoto().then((val) => setState(() {
          _userphoto = val;
        }));
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          //tasklist.filterList(_searchText);
        });
      } else {
        setState(() {
          _searchText = _filter.text;

          /// taskList.filterList(_searchText);
        });
      }
    });
  }

  Future<String> userphoto() async {
    String photo;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    photo = prefs.getString('profile');
    return photo;
  }

  //a
  int _selectedIndex = 0;
  // var _pageController = PageController();
  //final List<Widget>
  var _widgetOptions = <Widget>[
    Noti(),
    Project(),
    Task(),
    SearchPage(),
    Profile(),
  ];
  // @override
  // Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
  //  return didPushRouteInformation(routeInformation.location);
  // }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mainNavigatorKey,
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        child: CupertinoTabScaffold(
          // body: _widgetOptions.elementAt(_selectedIndex),
          // navigatorKey: navigatorKey,
          // pageRoute: PageRoutes.materialPageRoute),
          // bottomNavigationBar: BottomNavigationBar(

          tabBar: CupertinoTabBar(

              // showSelectedLabels: true,
              backgroundColor: Color.fromRGBO(0, 74, 173, 1),
              //selectedIconTheme: ,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none),
                  backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                  icon: Icon(Icons.photo_filter),
                  label: 'Projects',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pending_actions),
                  backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  backgroundColor: Color.fromRGBO(0, 74, 173, 1),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              // selectedItemColor: Colors.white,
              activeColor: Colors.white,
              // unselectedItemColor: Colors.grey[500],
              inactiveColor: Colors.grey[500],
              iconSize: 35,
              // elevation: 10,
              onTap: (index) {
                _onItemTapped(index);
              }),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: _widgetOptions.elementAt(index),
                  );
                });
              case 1:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: _widgetOptions.elementAt(index),
                  );
                });
              case 2:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: _widgetOptions.elementAt(index),
                  );
                });
              case 3:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: _widgetOptions.elementAt(index),
                  );
                });
              case 4:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: _widgetOptions.elementAt(index),
                  );
                });
            }
          },
        ),
        onWillPop: () async => !await navigatorKey.currentState.maybePop(),
      ),
    );
  }

  void _onItemTapped(int index) {
    navigatorKey.currentState.maybePop();
    setState(() {
      _selectedIndex = index;
      //_pageController.animateToPage(_selectedIndex,
      //   duration: Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  addButtonPressed() {
    String value = "";
    TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Project Name"),
                  controller: controller,
                  onChanged: (text) {
                    value = text;
                  },
                ),
                Divider(),
                Card(
                  child: Text(
                    "LAYOUT",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ));
      },
    );
  }
}
