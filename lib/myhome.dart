import 'package:flutter/material.dart';

import 'mainPage.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: MainPage(),
    );
  }
}
