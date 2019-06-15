import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:notes_app/myhome.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SplashScreen();
  }
}

class _SplashScreen extends State with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  Animation<double> animation2;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2, milliseconds: 200), () {
      return onDoneLoading();
    });
    controller = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    controller.forward();
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 1900),
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

      body: Stack(
//        decoration: BoxDecoration(
//          // Box decoration takes a gradient
//          gradient: LinearGradient(
//            // Where the linear gradient begins and ends
//            begin: Alignment.topLeft,
//            end: Alignment.bottomRight,
//            // Add one stop for each color. Stops should increase from 0 to 1
//            stops: [0.1, 0.5, 0.7, 0.9],
//            colors: [
//              // Colors are easy thanks to Flutter's Colors class.
//              Color(0xff003680),
//
//              Color(0xff004199),
//              Color(0xff004bb3),
//              Color(0xff004cb4),
//            ],
//          ),
//        ),
        children: <Widget>[
                Image.asset("images/back.png", fit: BoxFit.cover, height: double.infinity,width: double.infinity,) ,
                FadeTransition(
                  opacity: animation,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/book.png",
                          alignment: Alignment.center,
                          width: 270,
                        ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:  FadeTransition(
                  opacity: animation2,
                  child: new Text(
                    "EXPRESS YOURSELF",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic, color: Color(0xff001a3f)),textAlign: TextAlign.center,
                  ),
                ),

          )],
            ),
          ),
                )  ],
            ),


    );}
}
