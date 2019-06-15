import 'package:flutter/material.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/dateFormatter.dart';
import 'package:notes_app/mainPage.dart';
import 'package:notes_app/model.dart';
import 'package:notes_app/myhome.dart';
import 'package:shared_preferences/shared_preferences.dart';


class inputScreen extends StatefulWidget {
  final String title;
  final int edit;
  final String id;
  inputScreen({Key key, this.title, this.edit, this.id}) : super(key: key);
  @override
  _inputScreenState createState() => _inputScreenState();
}

class _inputScreenState extends State<inputScreen> {

  var db = DatabaseHelper();

  int savedId;

  TextEditingController dataEntry = TextEditingController();
  TextEditingController heading = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff004080 ),
        title: Text("New Dairy Entry"),
        actions: <Widget>[
          IconButton(icon:
          Icon(Icons.save),
            onPressed: () {
              _handleSubmitted(heading.text, dataEntry.text);
              heading.clear();
              dataEntry.clear();
              var router4= new MaterialPageRoute(
                  builder: (BuildContext context){
                    return Home();
                  }
              );
              Navigator.of(context).pushReplacement(router4);

            },),
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){  var router4= new MaterialPageRoute(
    builder: (BuildContext context){
    return Home();
    }
    );
    Navigator.of(context).pushReplacement(router4);}
    ,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0,8,0,2),
            child: ListTile(
              leading: Text(dateFormatted(4), style: TextStyle(
                fontStyle: FontStyle.italic, fontSize: 36,color: Colors.blue.shade900, fontWeight: FontWeight.w600
              ),),
              
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(dateFormatted(6),style: TextStyle(fontSize: 14),),
                  Text(dateFormatted(7).toUpperCase(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500), )
                ],
              ),
              trailing: Padding(
                padding: const EdgeInsets.fromLTRB(0,0,8,10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(dateFormatted(2))
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
            padding: EdgeInsets.fromLTRB(12,2,14,5),
            child: TextFormField(
              controller: heading,
              scrollPadding: EdgeInsets.all(8),
              onEditingComplete: () {
                _saveMessage(widget.id, dataEntry.text);
              },
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
                            autofocus: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: "Title :",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)

              ),

            ),
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(12,2,14,5),
            child: TextField(
              controller: dataEntry,
              scrollPadding: EdgeInsets.all(8),
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.newline,
              autofocus: false,
              maxLines: 9999,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: "Dear Diary,",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)

              ),

            ),
          ),
        ],
      ),);
  }

  _saveMessage(String id, String message) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(id, message);
  }

  void _handleSubmitted(String text, String entry) async {
    NoDoItem noDoItem = NoDoItem(
        text, dateFormatted(0), dateFormatted(1), dateFormatted(2),
        dateFormatted(3), entry);
    int savedItemId = await db.saveItem(noDoItem);
    savedId = savedItemId;
    NoDoItem addedItem = await db.getItem(savedItemId);
  }
}