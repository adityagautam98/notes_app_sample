import 'package:flutter/material.dart';

import 'mainPage.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff004080 ),
        title: Text("Dear Diary"),
      ),
      body: MainPage(),
    );
  }
}
