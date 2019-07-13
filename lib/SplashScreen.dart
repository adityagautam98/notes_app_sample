import 'package:flutter/material.dart';
import 'package:notes_app/globalVariables.dart' as data;
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:notes_app/model.dart';
import 'package:notes_app/myhome.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/dateFormatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SplashScreen();
  }
}

class _SplashScreen extends State with TickerProviderStateMixin {
  bool _saveData;
  int savedId;
  String titlesave = "Welcome to Dear Diary App";
  String savedata = "Let's take a walkthrough. Please tap to expand.\n\n\n"
      "1.Long press on home screen to edit title.\n"
      "2.Long press on this screen to copy your diary entry to clipboard, you can also use copy icon at top.\n"
      "3.Edit the diary entry by tapping on edit button.\n"
      "4.You can also select your theme from Display Settings and profile picture from User Settings";
  var db = DatabaseHelper();
  AnimationController controller;
  AnimationController controller2;
  Animation<double> animation2;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _loadSavedState();
    _loadSavedData();
    Timer(Duration(seconds: 1, milliseconds:0), () {
      return onDoneLoading();
    });
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    controller.forward();
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeInBack);
    controller2.forward();
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.

              Color(0xff7597f5),
              Color(0xff577ee9),
              Color(0xff486bcb),
              Color(0xff486bcb),
            ],
          ),
        ),
        child: Stack(
//
          children: <Widget>[
            FadeTransition(
              opacity: animation,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "images/Logo.png",
                      alignment: Alignment.center,
                      width: 270,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FadeTransition(
                        opacity: animation2,
                        child: Image.asset(
                          "images/title.png",
                          alignment: Alignment.center,
                          width: 270,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getInt("color") != null) {
        data.Variables.AppBarColor = preferences.getInt("color");
      } else
        data.Variables.AppBarColor = 0xff004080;
      if (preferences.getString("backclip") != null) {
        data.Variables.smallNote = preferences.getString("backclip");
      } else
        data.Variables.smallNote = "images/noteclip1.png";
      if (preferences.getString("backcover") != null) {
        data.Variables.notepad = preferences.getString("backcover");
      } else
        data.Variables.notepad = "images/noteback.png";

    });
  }

  _loadSavedState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getBool("loadingdata") != null) {
        _saveData = preferences.getBool("loadingdata");
      } else
        _saveData = true;
      if (preferences.getString("image_path") != null) {
        data.Variables.imagepath = preferences.getString("image_path");
      }
      if (preferences.getString("username") != null) {
        data.Variables.username = preferences.getString("username");
      } else data.Variables.username= "Dear Diary";
      if (_saveData) {
        //Keep this down or savedData has to be initialised.
        _saveLoadState(false);
        _handleSubmitted(titlesave, savedata);
      }
      print(_saveData);
    });
  }

  _saveLoadState(bool toLoad) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("loadingdata", toLoad);
  }

  void _handleSubmitted(String text, String entry) async {
    NoDoItem noDoItem = NoDoItem(text, entry, dateFormatted(1), dateFormatted(2), dateFormatted(3), dateFormatted(4), dateFormatted(5), dateFormatted(6));
    int savedItemId = await db.saveItem(noDoItem);
    savedId = savedItemId;
  }
}
