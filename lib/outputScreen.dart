import 'package:flutter/material.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/model.dart';
import 'package:notes_app/updateScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class outputScreen extends StatefulWidget {
  final String title;
  final NoDoItem item;
  final int index;
  final String data;
  outputScreen({Key key, this.title, this.data, this.item, this.index}) : super(key: key);
  
  @override
  _outputScreenState createState() => _outputScreenState();
}

class _outputScreenState extends State<outputScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff004080 ),
        title: Text("My Diary"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: (){
            var router= new MaterialPageRoute(
                builder: (BuildContext context){
                  return updateScreen(title: widget.title, data: widget.data, index: widget.index, item: widget.item,);
                }
            );
                       Navigator.of(context).pushReplacement(router);


          })
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ListView(
          children: <Widget>[
                  Center(child: Text("${widget.title}", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,10,5,10),
                    child: Text("${widget.data}",textAlign: TextAlign.left, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,),)
                   ),]
            ),
      ),
    );
  }


}
