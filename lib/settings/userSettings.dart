import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:notes_app/settings/setting.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:notes_app/globalVariables.dart' as data;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSetting extends StatefulWidget {
  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  static String Imgpath;
  var usernamecont = TextEditingController();
  var descriptioncont = TextEditingController();
  File _image;
  bool saved = false;
  bool saved2 = false;

  void setUsername() {
    savename();

    setState(() {
      saved = false;
      data.Variables.username = usernamecont.text;
    });
  }

  void setDescription() {
    savedesc();

    setState(() {
      saved2 = false;
      data.Variables.description = descriptioncont.text;
    });
  }

  void savename() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', usernamecont.text);
     }

  void savedesc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dn', descriptioncont.text);
      }

  Future getImage() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
    );
    if (image == null) return;

// Get directory where we can duplicate selected file.
    final String path = (await getApplicationDocumentsDirectory()).path;

// Copy the file to a application document directory.
    var fileName = basename(image.path);
    final File localImage = await image.copy('$path/$fileName');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('image_path', localImage.path);

    setState(() {
      _image = image;
      data.Variables.imagepath = localImage.path;
    });
  }

  MediaQueryData queryData;

  @override
  void initState() {
    usernamecont.text = data.Variables.username;
    descriptioncont.text=data.Variables.description;
    _loadSavedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    double top15 = 15 / queryData.textScaleFactor;
    return Scaffold(
      drawer: SizedBox(
        width: queryData.size.width * .72,
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
                              width: 130 / queryData.textScaleFactor,
                              height: 130 / queryData.textScaleFactor,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    blurRadius: 8.0 / queryData.textScaleFactor,
                                  )
                                ],
                                color: Colors.white,
                                // The border you want
                                border: new Border.all(
                                  width: 3.0 / queryData.textScaleFactor,
                                  color: Colors.grey.shade300,
                                ),

                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onLongPress: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          UserSetting()));
                                },
                                child: CircleAvatar(
                                  radius: 65 / queryData.textScaleFactor,
                                  backgroundImage:
                                      data.Variables.imagepath == null
                                          ? AssetImage("images/Logo.png")
                                          : FileImage(
                                              File(data.Variables.imagepath)),
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
                              margin: EdgeInsets.fromLTRB(0, 3, 0, top15),
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
                              style: TextStyle(
                                  fontSize: 17 / queryData.textScaleFactor),
                            ),
                            trailing: Icon(Icons.home),
                            onTap: () {
                              setState(() {
                                data.Variables.index = 0;
                              });
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                          ),
                          ListTile(
                              title: Text(
                                "User Settings",
                                style: TextStyle(
                                    fontSize: 17 / queryData.textScaleFactor),
                              ),
                              trailing: Icon(Icons.edit),
                              onTap: () {
                                Navigator.pop(context);
                              }),
                          ListTile(
                            title: Text("Display Settings",
                                style: TextStyle(
                                    fontSize: 17 / queryData.textScaleFactor)),
                            trailing: Icon(Icons.settings),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
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
      ),
      appBar: AppBar(
        title: Text("User Settings"),
        backgroundColor: Color(data.Variables.AppBarColor),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.done_all),
              onPressed: () {
                if (usernamecont!=null) {
                  setUsername();
                }
                if (descriptioncont!=null) {
                  setDescription();
                }
                Navigator.pop(context);
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 5, 0),
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 34, top: 35, bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: queryData.size.width * .35,
                                height: queryData.size.width * .35,
                                child: _image == null
                                    ? Image.asset(
                                        "images/Logo.png",
                                        fit: BoxFit.fitWidth,
                                      )
                                    : Image.file(
                                        _image,
                                        fit: BoxFit.fitWidth,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                iconSize: 28,
                                icon: Icon(Icons.mode_edit),
                                onPressed: getImage)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(7, 10, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Color(data.Variables.AppBarColor),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Image.asset("images/pic.png", color: Colors.white, width: 25/queryData.textScaleFactor,),
                              onPressed: null),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,12,0),
                              child: AutoSizeText(
                                "User Profile",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13 / queryData.textScaleFactor),
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
          Container(
             child: Stack(
              children: [Container(
                margin: EdgeInsets.fromLTRB(30,15,5,0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8,20,0,20),
                    child: ConfigurableExpansionTile(
                      onExpansionChanged: (bool t) {
                        if (!t) {
                          setState(() {
                            saved = false;
                          });
                        }
                      },
                      animatedWidgetFollowingHeader: Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: const Icon(
                          Icons.edit,
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
                                  padding: const EdgeInsets.only(left: 30, right: 0),
                                  child: AutoSizeText(
                                    "Edit Username",
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 20 / queryData.textScaleFactor),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: saved ? "Username saved" : "Tap to edit",
                            ),
                            controller: usernamecont,
                            onSubmitted: (String value) {
                              FocusScope.of(context).requestFocus(new FocusNode());
                            },
                            onEditingComplete: () {
                              setUsername;
                              setState(() {
                                saved = true;
                              });
                            },
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            setUsername();
                            FocusScope.of(context).requestFocus(new FocusNode());
                            setState(() {
                              saved = true;
                            });
                          },
                          child: Text("Save"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
                Container(
                  margin: EdgeInsets.fromLTRB(15,5,0,0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(data.Variables.AppBarColor),
                    child: Image.asset("images/user.png", width: 22,color: Colors.white,),
                  ),
                )
              ]
            ),
          ),
          Stack(
            children:[ Container(
              margin: EdgeInsets.fromLTRB(30,15,5,0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 20,0, 20),
                  child: ConfigurableExpansionTile(
                    onExpansionChanged: (bool t) {
                      if (!t) {
                        setState(() {
                          saved = false;
                        });
                      }
                    },
                    animatedWidgetFollowingHeader: Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: const Icon(
                        Icons.edit,
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
                                padding: const EdgeInsets.only(left: 30, right: 0),
                                child: AutoSizeText(
                                  "Edit Description",
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 20 / queryData.textScaleFactor),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: saved2 ? "Description saved" : "Tap to edit",
                          ),
                          controller: descriptioncont,
                          onSubmitted: (String value) {
                            FocusScope.of(context).requestFocus(new FocusNode());
                          },
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setDescription();
                          FocusScope.of(context).requestFocus(new FocusNode());
                          setState(() {
                            saved2 = true;
                          });
                        },
                        child: Text("Save"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 0,0),
            
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(data.Variables.AppBarColor),
              child: Image.asset("images/desc.png", width: 22, color: Colors.white,),
            ),)
            ]
          ),
        ],
      ),
    );
  }

  _loadSavedState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      if (pref.getString("image_path") != null) {
        Imgpath = pref.getString("image_path");
        _image = File(Imgpath);
      }
    });
  }
}
