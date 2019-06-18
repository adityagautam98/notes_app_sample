import 'package:notes_app/globalVariables.dart' as data;
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:notes_app/myhome.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selected;

  File _image;
  String location;
  String fileName;

  Future getImageCamera() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    location = (await getApplicationDocumentsDirectory()).path;
    fileName = basename(image.path);
    final File newImage = await image.copy('$location/$fileName');

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _getLocalFile(fileName, location);
  }

  void selectMethod(int value) {
  setState(() {
    selected = value;

    switch(value){
      case 0: {data.Variables.AppBarColor= 0xff004080;
      _saveMessage(0xff004080);
      break;}
      case 1:{ data.Variables.AppBarColor= 0xffef3979;
      _saveMessage(0xffef3979);
      break;}
      case 2: {data.Variables.AppBarColor=0xffc828d2;
      _saveMessage(0xffc828d2);
        break;}
      case 3: {data.Variables.AppBarColor=0xff009cff;
      _saveMessage(0xffc009cff);
      break;


      }
      case 4: {data.Variables.AppBarColor=0xff009e34;
      _saveMessage(0xff009e34);
      break;


      }
      case 5: {data.Variables.AppBarColor=0xffe2cf5a;
      _saveMessage(0xffe2cf5a);
      break;


      }
      case 6: {data.Variables.AppBarColor=0xff00b990;
      _saveMessage(0xff00b990);
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
                                      builder: (BuildContext context) =>
                                          Home()));
                                }
                              }),
                          ListTile(
                            title: Text("Settings",
                                style: TextStyle(fontSize: 17)),
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
          Container(alignment: Alignment.topLeft,
              child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 5,0),
            child: Text("1. Choose theme color :", style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500
            ),),
          )),
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
                                  color: Color(0xff004080),),
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
                                  color: Color(0xffef3979) ,),

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
                              color: Color(0xffc828d2),),
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
                                  activeColor: Colors.red.shade900,
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
                              color: Color(0xffe2cf5a),)

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
                                  color: Color(0xff00b990),)

                              ],
                            ),
                          ),
                                                 ])),
              )),



          _image == null ? Text('No image selected.') : Image.file(_image),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: getImageCamera,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ));
  }

  Future<File> _getLocalFile(String filename, String location) async {
    String dir = location;
    File f = new File('$dir/$filename');
    return f;
  }

  _saveMessage(int color) async{

    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setInt("color", color);
  }

  _loadSavedData() async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    setState(() {
      if(preferences.getInt("color")!=null){
        data.Variables.AppBarColor =preferences.getInt("color");}
      else data.Variables.AppBarColor= 0xff004080;
    });
  }

}
