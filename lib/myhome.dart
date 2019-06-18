import 'package:flutter/material.dart';
import 'package:notes_app/model.dart';
import 'package:notes_app/settings/setting.dart';
import 'package:notes_app/dateFormatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainPage.dart';
import 'package:notes_app/globalVariables.dart' as data;
import 'database.dart';
import 'notesScreen/notepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexstate=0;
  final pages = [MainPage(), notesPage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 20,
        child: Container(
          color: Color(data.Variables.AppBarColor),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      accountName: Text(
                        "Dear Diary",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      accountEmail: Text("Your companion",
                          style:
                          TextStyle(color: Colors.black54, fontSize: 16)),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Color(0xff91aaef),
                        child: Image.asset(
                          "images/logo1.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey.shade200,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Home",
                            style: TextStyle(fontSize: 17),
                          ),
                          trailing: Icon(Icons.home),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title:
                          Text("Settings", style: TextStyle(fontSize: 17)),
                          trailing: Icon(Icons.settings),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Settings()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade200,
          currentIndex: _indexstate,
          fixedColor: Color(data.Variables.AppBarColor),
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text("Home"),
                backgroundColor: Colors.amberAccent),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.event_note),
                title: new Text("Notes"),
                backgroundColor: Colors.amberAccent),
          ],
          onTap: (int i) {
            setState(() {
              _indexstate = i;
            });
          }),
      appBar: AppBar(
        backgroundColor: Color(data.Variables.AppBarColor),
        title: Text("Dear Diary"),
        elevation: 15,
      ),
      body: pages[_indexstate],
    );
  }
}

