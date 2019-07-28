import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notes_app/settings/setting.dart';
import 'package:notes_app/settings/userSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainPage.dart';
import 'package:notes_app/globalVariables.dart' as data;
import 'notesScreen/notepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MediaQueryData queryData;
  final pages = [MainPage(), NotesPage()];

  @override
  void initState() {
    _loadSavedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    double top15= 15/queryData.textScaleFactor;
    return Scaffold(
      drawer: SizedBox(
        width: queryData.size.width*.72,
        child: Drawer(
          elevation: 20,
          child: Container(
            color: Color(data.Variables.AppBarColor),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/backgrd.jpg"),
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                  Color(data.Variables.AppBarColor),
                                  BlendMode.modulate))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, top15, 0, 6),
                              width: 130/queryData.textScaleFactor,
                              height: 130/queryData.textScaleFactor,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    blurRadius: 8.0,
                                  )
                                ],
                                color: Colors.white,
                                // The border you want
                                border: new Border.all(
                                  width: 3.0,
                                  color: Colors.grey.shade300,
                                ),

                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onLongPress: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          UserSetting()));
                                },
                                child: CircleAvatar(
                                  radius: 65/queryData.textScaleFactor,
                                  backgroundImage: data.Variables.imagepath ==
                                          null
                                      ? AssetImage("images/Logo.png")
                                      : FileImage(File(data.Variables.imagepath)),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "${data.Variables.username}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20 / queryData.textScaleFactor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 3,0,top15),
                              alignment: Alignment.center,
                              child: Text(
                                "${data.Variables.description}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16 / queryData.textScaleFactor),
                              ),
                            ),

                          ])),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade200,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Home",
                              style: TextStyle(fontSize: 17/queryData.textScaleFactor),
                            ),
                            trailing: Icon(Icons.home),
                            onTap: () {
                              Navigator.of(context).pop();
                              if (data.Variables.switcher) {
                                setState(() {
                                  data.Variables.index = 0;
                                });
                              }
                            },
                          ),
                          ListTile(
                              title: Text(
                                "User Settings",
                                style: TextStyle(fontSize: 17/queryData.textScaleFactor),
                              ),
                              trailing: Icon(Icons.edit),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context).popUntil((route)=>route.isFirst);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        UserSetting()));
                              }),
                          ListTile(
                            title: Text("Display Settings",
                                style: TextStyle(fontSize: 17/queryData.textScaleFactor)),
                            trailing: Icon(Icons.settings),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).popUntil((route)=>route.isFirst);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Settings()));
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
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade200,
          currentIndex: data.Variables.index,
          fixedColor: Color(data.Variables.AppBarColor),
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.book),
                title: new Text("Diary"),
                backgroundColor: Colors.amberAccent),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.event_note),
                title: new Text("Notes"),
                backgroundColor: Colors.amberAccent),
          ],
          onTap: (int i) {
            setState(() {
              data.Variables.index=i;
            });
          }),
      appBar: AppBar(
        backgroundColor: Color(data.Variables.AppBarColor),
        title: Text("Dear Diary"),
        elevation: 15,
      ),
      body: pages[data.Variables.index],
    );
  }

  _loadSavedState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
//      if (pref.getString("image_path") != null) {
//        data.Variables.imagepath = pref.getString("image_path");
//      }
//      if (pref.getString("username") != null) {
//        data.Variables.username = pref.getString("username");
//      } else data.Variables.username= "Dear Diary";
      if (pref.getString("dn") != null) {
        data.Variables.description = pref.getString("dn");
      } else data.Variables.description= "Your Companion";


    });
  }
}
