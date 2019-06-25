import 'dart:io';

import 'package:notes_app/globalVariables.dart' as data;
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:notes_app/myhome.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:notes_app/settings/userSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  MediaQueryData queryData;
  int selected;
  int back;
  int backgroundmain;
  bool shade = false;
  int shadeselect = null;
  int ss1;
  int ss2;
  int ss3;
  int ss4;
  int ss5;
  int ss6;
  int ss7;

  void selectMethod(int value) {
    setState(() {
      selected = value;

      switch (value) {
        case 0:
          {
            data.Variables.AppBarColor = 0xff004080;
            _saveMessage(0xff004080);
            shade = true;
            shadeselect = null;
            ss1 = 0xff001a34;
            ss2 = 0xff00274d;
            ss3 = 0xff003367;
            ss4 = 0xff004d9a;
            ss5 = 0xff005ab3;
            ss6 = 0xff0066cd;
            ss7 = 0xff1b8cff;
            break;
          }
        case 1:
          {
            data.Variables.AppBarColor = 0xffef3979;
            _saveMessage(0xffef3979);
            shadeselect = null;
            shade = true;
            ss1 = 0xffcb1052;
            ss2 = 0xffe3125c;
            ss3 = 0xffed2169;
            ss4 = 0xffef3979;
            ss5 = 0xfff15189;
            ss6 = 0xfff580a9;
            ss7 = 0xfff9afc9;
            break;
          }
        case 2:
          {
            data.Variables.AppBarColor = 0xffc828d2;
            _saveMessage(0xffc828d2);
            shade = true;
            shadeselect = null;
            ss1 = 0xff8b1c92;

            ss2 = 0xff9f20a7;
            ss3 = 0xffb424bd;
            ss4 = 0xffc828d2;
            ss5 = 0xffd03ad9;
            ss6 = 0xffda65e2;
            ss7 = 0xffdf7ae6;
            break;
          }
        case 3:
          {
            data.Variables.AppBarColor = 0xff009cff;
            _saveMessage(0xffc009cff);
            shadeselect = null;
            shade = true;
            ss1 = 0xff006db3;
            ss2 = 0xff007dcc;
            ss3 = 0xff008ce6;
            ss4 = 0xff009cff;
            ss5 = 0xff33b0ff;
            ss6 = 0xff4dbaff;
            ss7 = 0xff67c4ff;
            break;
          }
        case 4:
          {
            data.Variables.AppBarColor = 0xff009e34;
            _saveMessage(0xff009e34);
            shade = true;
            shadeselect = null;
            ss1 = 0xff00521b;
            ss2 = 0xff006b23;
            ss3 = 0xff00852c;
            ss4 = 0xff009e34;
            ss5 = 0xff00b83c;
            ss6 = 0xff00d145;
            ss7 = 0xff00eb4d;
            break;
          }
        case 5:
          {
            data.Variables.AppBarColor = 0xffe2cf5a;
            shade = true;
            shadeselect = null;
            _saveMessage(0xffe2cf5a);
            ss1 = 0xffe2ad5a;
            ss2 = 0xffe2b85a;
            ss3 = 0xffccb424;
            ss4 = 0xffdac22f;
            ss5 = 0xffdec944;
            ss6 = 0xffe2cf5a;
            ss7 = 0xffe6d175;
            break;
          }
        case 6:
          {
            data.Variables.AppBarColor = 0xff00b990;
            shade = true;
            shadeselect = null;
            ss1 = 0xff006d54;
            ss2 = 0xff008668;
            ss3 = 0xff00a07c;
            ss4 = 0xff00b990;
            ss5 = 0xff00b990;
            ss6 = 0xff00b4b9;
            ss7 = 0xff00cdd3;
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
        case 6:
          {
            data.Variables.AppBarColor = ss7;
            shade = true;
            _saveMessage(ss7);
            break;
          }
      }
    });
  }

  void selectbackground(int value) {
    setState(() {
      back = value;

      switch (value) {
        case 0:
          {
            data.Variables.smallNote = "images/noteclip1.png";
            _saveBackground("images/noteclip1.png");
            break;
          }
        case 1:
          {
            data.Variables.smallNote = "images/noteclip2.png";
            _saveBackground("images/noteclip2.png");
            break;
          }
      }
    });
  }

  void selectNotebackground(int value) {
    setState(() {
      backgroundmain = value;

      switch (value) {
        case 0:
          {
            data.Variables.notepad = "images/noteback.png";
            _saveNoteBackground("images/noteback.png");
            break;
          }
        case 1:
          {
            data.Variables.notepad = "images/noteback1.png";
            _saveNoteBackground("images/noteback1.png");
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    double top15= 15/queryData.textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Settings"),
        backgroundColor: Color(data.Variables.AppBarColor),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.done_all),
              onPressed: () => Navigator.pop(context))
        ],
      ),
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
                                  width: 3.0/queryData.textScaleFactor,
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
                                  radius: 65,
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,3,0,16),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0,3,0, top15),
                                alignment: Alignment.center,
                                child: Text(
                                  "${data.Variables.description}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16 / queryData.textScaleFactor),
                                ),
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
                              if (data.Variables.switcher) {
                                setState(() {
                                  data.Variables.index = 0;
                                });
                              }
                              Navigator.pop(context);
                              Navigator.of(context).popUntil((route)=>route.isFirst);
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
      ),
      body: Container(
        child: ListView(children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 8, 0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 18, 2, 18),
                  child: Column(children: <Widget>[
                    ConfigurableExpansionTile(
                        onExpansionChanged: (bool t) {
                          setState(() {
                            if (!t) {
                              shade = false;
                            }
                          });
                        },
                        animatedWidgetFollowingHeader: Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: const Icon(
                            Icons.expand_more,
                            color: const Color(0xFF707070),
                          ),
                        ),
                        header: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: queryData.size.width * .45,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, right: 30),
                                  child: AutoSizeText(
                                    "Theme Colour",
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize:
                                            25 / queryData.textScaleFactor),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  color: Color(data.Variables.AppBarColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 25, 8, 10),
                            child: Container(
                              alignment: Alignment.center,
                              child: new SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  color: Color(0xff004080),
                                                ),
                                              ),
                                              new Radio<int>(
                                                value: 0,
                                                groupValue: selected,
                                                activeColor: Color(0xff004080),
                                                onChanged: selectMethod,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(7)),
                                        new Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  color: Color(0xffef3979),
                                                ),
                                              ),
                                              new Radio<int>(
                                                value: 1,
                                                groupValue: selected,
                                                activeColor: Color(0xffef3979),
                                                onChanged: selectMethod,
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
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  color: Color(0xffc828d2),
                                                ),
                                              ),
                                              new Radio<int>(
                                                value: 2,
                                                groupValue: selected,
                                                activeColor: Color(0xffc828d2),
                                                onChanged: selectMethod,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(7)),
                                        new Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  color: Color(0xff009cff),
                                                ),
                                              ),
                                              new Radio<int>(
                                                value: 3,
                                                groupValue: selected,
                                                activeColor: Color(0xff009cff),
                                                onChanged: selectMethod,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(7)),
                                        new Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  color: Color(0xff009e34),
                                                ),
                                              ),
                                              new Radio<int>(
                                                value: 4,
                                                groupValue: selected,
                                                activeColor: Color(0xff009e34),
                                                onChanged: selectMethod,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(7)),
                                        new Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  color: Color(0xffe2cf5a),
                                                ),
                                              ),
                                              new Radio<int>(
                                                value: 5,
                                                groupValue: selected,
                                                activeColor: Color(0xffe2cf5a),
                                                onChanged: selectMethod,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(7)),
                                        new Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  color: Color(0xff00b990),
                                                ),
                                              ),
                                              new Radio<int>(
                                                value: 6,
                                                groupValue: selected,
                                                activeColor: Color(0xff00b990),
                                                onChanged: selectMethod,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ])),
                            ),
                          ),
                          Container(
                              child: shade
                                  ? ConfigurableExpansionTile(
                                      onExpansionChanged: (bool t) {
                                        if (!t) {
                                          setState(() {
                                            shadeselect = null;
                                            shade = false;
                                          });
                                        }
                                      },
                                      animatedWidgetFollowingHeader: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 28.0),
                                        child: const Icon(
                                          Icons.expand_more,
                                          color: const Color(0xFF707070),
                                        ),
                                      ),
                                      header: Flexible(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: AutoSizeText(
                                                "You can also choose between shades",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ])),
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(8, 18, 8, 0),
                                          alignment: Alignment.center,
                                          child: new SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(0)),
                                                    new Flexible(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              color: Color(ss1),
                                                            ),
                                                          ),
                                                          new Radio<int>(
                                                            value: 0,
                                                            groupValue:
                                                                shadeselect,
                                                            activeColor:
                                                                Color(ss1),
                                                            onChanged:
                                                                selectShadeMethod,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(7)),
                                                    new Flexible(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              color: Color(ss2),
                                                            ),
                                                          ),
                                                          new Radio<int>(
                                                            value: 1,
                                                            groupValue:
                                                                shadeselect,
                                                            activeColor:
                                                                Color(ss2),
                                                            onChanged:
                                                                selectShadeMethod,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(7)),
                                                    new Flexible(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              color: Color(ss3),
                                                            ),
                                                          ),
                                                          new Radio<int>(
                                                            value: 2,
                                                            groupValue:
                                                                shadeselect,
                                                            activeColor:
                                                                Color(ss3),
                                                            onChanged:
                                                                selectShadeMethod,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(7)),
                                                    new Flexible(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              color: Color(ss4),
                                                            ),
                                                          ),
                                                          new Radio<int>(
                                                            value: 3,
                                                            groupValue:
                                                                shadeselect,
                                                            activeColor:
                                                                Color(ss4),
                                                            onChanged:
                                                                selectShadeMethod,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(7)),
                                                    new Flexible(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              color: Color(ss5),
                                                            ),
                                                          ),
                                                          new Radio<int>(
                                                            value: 4,
                                                            groupValue:
                                                                shadeselect,
                                                            activeColor:
                                                                Color(ss5),
                                                            onChanged:
                                                                selectShadeMethod,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(7)),
                                                    new Flexible(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              color: Color(ss6),
                                                            ),
                                                          ),
                                                          new Radio<int>(
                                                            value: 5,
                                                            groupValue:
                                                                shadeselect,
                                                            activeColor:
                                                                Color(ss6),
                                                            onChanged:
                                                                selectShadeMethod,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(7)),
                                                    new Flexible(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              color: Color(ss7),
                                                            ),
                                                          ),
                                                          new Radio<int>(
                                                            value: 6,
                                                            groupValue:
                                                                shadeselect,
                                                            activeColor:
                                                                Color(ss7),
                                                            onChanged:
                                                                selectShadeMethod,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ])),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      height: 0,
                                      width: 0,
                                    )),
                        ]),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(9.0, 2, 8, 8),
              child: Icon(
                Icons.settings,
                size: 34,
                color: Color(data.Variables.AppBarColor),
              ),
            ),
          ]),
          Stack(children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 8, 0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 18, 2, 18),
                  child: ConfigurableExpansionTile(
                      header: Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: queryData.size.width * .62,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: AutoSizeText(
                                  "Select Clip background",
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 25 / queryData.textScaleFactor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      animatedWidgetFollowingHeader: Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: const Icon(
                          Icons.expand_more,
                          color: const Color(0xFF707070),
                        ),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 20, 4, 0),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Flexible(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Card(
                                              color: Colors.grey.shade200,
                                              child: Container(
                                                width: 90,
                                                height: 100,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: (Image.asset(
                                                      "images/noteclip1.png")),
                                                ),
                                              )),
                                          new Radio<int>(
                                            value: 0,
                                            groupValue: back,
                                            activeColor: Color(0xff004080),
                                            onChanged: selectbackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(25)),
                                    new Flexible(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Card(
                                              color: Colors.grey.shade200,
                                              child: Container(
                                                  width: 90,
                                                  height: 100,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      "images/noteclip2.png",
                                                    ),
                                                  ))),
                                          new Radio<int>(
                                            value: 1,
                                            groupValue: back,
                                            activeColor: Color(0xff004080),
                                            onChanged: selectbackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(12, 2, 8, 8),
                child: Image.asset(
                  "images/thumb3.png",
                  color: Color(data.Variables.AppBarColor),
                  width: 30,
                ))
          ]),
          Stack(children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 8, 0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 18, 2, 18),
                  child: ConfigurableExpansionTile(
                      header: Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: queryData.size.width * .64,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 30.0,
                                ),
                                child: AutoSizeText(
                                  "Select Note pad background",
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 25 / queryData.textScaleFactor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      animatedWidgetFollowingHeader: Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: const Icon(
                          Icons.expand_more,
                          color: const Color(0xFF707070),
                        ),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 20, 4, 0),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Flexible(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Card(
                                              color: Colors.grey.shade200,
                                              child: Container(
                                                width: 110,
                                                height: 130,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: (Image.asset(
                                                      "images/notethumbpng.png")),
                                                ),
                                              )),
                                          new Radio<int>(
                                            value: 0,
                                            groupValue: backgroundmain,
                                            activeColor: Color(0xff004080),
                                            onChanged: selectNotebackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(25)),
                                    new Flexible(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Card(
                                              color: Colors.grey.shade200,
                                              child: Container(
                                                  width: 110,
                                                  height: 130,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      "images/notethumb2.png",
                                                    ),
                                                  ))),
                                          new Radio<int>(
                                            value: 1,
                                            groupValue: backgroundmain,
                                            activeColor: Color(0xff004080),
                                            onChanged: selectNotebackground,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 8, 0),
                child: Image.asset(
                  "images/thumb.png",
                  color: Color(data.Variables.AppBarColor),
                  width: 30,
                ))
          ]),
          Divider()
        ]),
      ),
    );
  }

  _saveMessage(int color) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("color", color);
  }

  _saveBackground(String img) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("backclip", img);
  }

  _saveNoteBackground(String img) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("backcover", img);
  }
}
