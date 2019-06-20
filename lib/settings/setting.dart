import 'package:notes_app/globalVariables.dart' as data;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notes_app/myhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selected;
  var focus= FocusNode();
  bool shade = false;
  int shadeselect=null;
int ss1;
int ss2;
int ss3;
int ss4;
int ss5;
int ss6;
  void selectMethod(int value) {
    setState(() {
      selected = value;

      switch (value) {
        case 0:
          {
            data.Variables.AppBarColor = 0xff004080;
            _saveMessage(0xff004080);
            shade = true;
            shadeselect=null;
            ss1=0xff001a34;
            ss2=0xff00274d;
            ss3=0xff003367;
            ss4=0xff004d9a;
            ss5=0xff005ab3;
            ss6=0xff0066cd;
            break;
          }
        case 1:
          {
            data.Variables.AppBarColor = 0xffef3979;
            _saveMessage(0xffef3979);
            shadeselect=null;
            shade = true;
            ss1=0xffcb1052;
            ss2=0xffe3125c;
            ss3=0xffed2169;
            ss4=0xffef3979;
            ss5=0xfff15189;
            ss6=0xfff580a9;
            break;
          }
        case 2:
          {
            data.Variables.AppBarColor = 0xffc828d2;
            _saveMessage(0xffc828d2);
            shade = true;
            shadeselect=null;
            ss1=0xff8b1c92;

            ss2=0xff9f20a7;
            ss3=0xffb424bd;
            ss4=0xffc828d2;
            ss5=0xffd03ad9;
            ss6=0xffda65e2;
            break;
          }
        case 3:
          {
            data.Variables.AppBarColor = 0xff009cff;
            _saveMessage(0xffc009cff);
            shadeselect=null;
            shade = true;
            ss1=0xff006db3;
            ss2=0xff007dcc;
            ss3=0xff008ce6;
            ss4=0xff009cff;
            ss5=0xff33b0ff;
            ss6=0xff4dbaff;
            break;
          }
        case 4:
          {
            data.Variables.AppBarColor = 0xff009e34;
            _saveMessage(0xff009e34);
            shade = true;
            shadeselect=null;
            ss1=0xff00521b;
            ss2=0xff006b23;
            ss3=0xff00852c;
            ss4=0xff009e34;
            ss5=0xff00b83c;
            ss6=0xff00d145;
            break;
          }
        case 5:
          {
            data.Variables.AppBarColor = 0xffe2cf5a;
            shade = true;
            shadeselect=null;
            _saveMessage(0xffe2cf5a);
            ss1=0xffe2ad5a;
            ss2=0xffe2b85a;
            ss3=0xffccb424;
            ss4=0xffdac22f;
            ss5=0xffdec944;
            ss6=0xffe2cf5a;
            break;
          }
        case 6:
          {
            data.Variables.AppBarColor = 0xff00b990;
            shade = true;
            shadeselect=null;
            ss1=0xff006d54;
            ss2=0xff008668;
            ss3=0xff00a07c;
            ss4=0xff00b990;
            ss5=0xff00b990;
            ss6=0xff00b4b9;
            _saveMessage(0xff00b990);
            break;
          }
      }
    });
  }
  void selectShadeMethod(int value) {
    setState(() {
      shadeselect = value;

      switch (value) {
        case 0:
          {
            data.Variables.AppBarColor = ss1;
            _saveMessage(ss1);
            shade = true;
            break;
          }
        case 1:
          {
            data.Variables.AppBarColor = ss2;
            _saveMessage(ss2);
            shade = true;
            break;
          }
        case 2:
          {
            data.Variables.AppBarColor = ss3;
            _saveMessage(ss3);
            shade = true;
            break;
          }
        case 3:
          {
            data.Variables.AppBarColor = ss4;
            _saveMessage(ss4);
            shade = true;
            break;
          }
        case 4:
          {
            data.Variables.AppBarColor = ss5;
            _saveMessage(ss5);
            shade = true;
            break;
          }
        case 5:
          {
            data.Variables.AppBarColor = ss6;
            shade = true;
            _saveMessage(ss6);
            break;
          }
         }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(data.Variables.AppBarColor),
      ),
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
                              try {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              } catch (e) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Home()));
                              }
                            }),
                        ListTile(
                          title:
                              Text("Settings", style: TextStyle(fontSize: 17)),
                          trailing: Icon(Icons.settings),
                          onTap: () {
                            Navigator.of(context).pop();
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
      body: Column(children: [
        ExpansionTile(
            title: Text(
              "1. Choose theme Color :",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: new Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: new SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(0)),
                              new Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Radio<int>(
                                      value: 0,
                                      groupValue: selected,
                                      activeColor: Color(0xff004080),
                                      onChanged: selectMethod,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Color(0xff004080),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              new Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Radio<int>(
                                      value: 1,
                                      groupValue: selected,
                                      activeColor: Color(0xffef3979),
                                      onChanged: selectMethod,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Color(0xffef3979),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              new Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Radio<int>(
                                      value: 2,
                                      groupValue: selected,
                                      activeColor: Color(0xffc828d2),
                                      onChanged: selectMethod,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Color(0xffc828d2),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              new Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Radio<int>(
                                      value: 3,
                                      groupValue: selected,
                                      activeColor:Color(0xff009cff),
                                      onChanged: selectMethod,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Color(0xff009cff),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              new Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Radio<int>(
                                      value: 4,
                                      groupValue: selected,
                                      activeColor: Colors.brown.shade400,
                                      onChanged: selectMethod,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Color(0xff009e34),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              new Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Radio<int>(
                                      value: 5,
                                      groupValue: selected,
                                      activeColor: Color(0xffe2cf5a),
                                      onChanged: selectMethod,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Color(0xffe2cf5a),
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              new Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Radio<int>(
                                      value: 6,
                                      groupValue: selected,
                                      activeColor: Color(0xff00b990),
                                      onChanged: selectMethod,
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Color(0xff00b990),
                                    )
                                  ],
                                ),
                              ),
                            ])),
                  )),
            ]),
        Container(
            child: shade
                ? ExpansionTile(
              onExpansionChanged: (bool t){
                shadeselect=null;
              },
                    title: Text("You can also choose shade:"),
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: new Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: new SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(0)),
                                new Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Radio<int>(
                                        value: 0,
                                        groupValue: shadeselect,
                                        activeColor: Color(ss1),
                                        onChanged: selectShadeMethod,
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        color: Color(ss1),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(7)),
                                new Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Radio<int>(
                                        value: 1,
                                        groupValue: shadeselect,
                                        activeColor: Color(ss2),
                                        onChanged: selectShadeMethod,
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        color: Color(ss2),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(7)),
                                new Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Radio<int>(
                                        value: 2,
                                        groupValue: shadeselect,
                                        activeColor: Color(ss3),
                                        onChanged: selectShadeMethod,
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        color: Color(ss3),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(7)),
                                new Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Radio<int>(
                                        value: 3,
                                        groupValue: shadeselect,
                                        activeColor: Color(ss4),
                                        onChanged: selectShadeMethod,
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        color: Color(ss4),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(7)),
                                new Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Radio<int>(
                                        value: 4,
                                        groupValue: shadeselect,
                                        activeColor: Color(ss5),
                                        onChanged: selectShadeMethod,
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        color: Color(ss5),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(7)),
                                new Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Radio<int>(
                                        value: 5,
                                        groupValue: shadeselect,
                                        activeColor: Color(ss6),
                                        onChanged: selectShadeMethod,
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        color: Color(ss6),
                                      ),
                                    ],
                                  ),
                                ),



                              ])),
                    )),

              ],
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ))
      ]),
    );
  }

  _saveMessage(int color) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("color", color);
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getInt("color") != null) {
        data.Variables.AppBarColor = preferences.getInt("color");
      } else
        data.Variables.AppBarColor = 0xff004080;
    });
  }
}
