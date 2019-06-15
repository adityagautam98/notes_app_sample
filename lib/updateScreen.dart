import 'package:flutter/material.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/dateFormatter.dart';
import 'package:notes_app/model.dart';
import 'package:notes_app/myhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class updateScreen extends StatefulWidget {
  final String title;
  final NoDoItem item;
  final int index;
  final String data;

  updateScreen({Key key, this.title, this.data, this.index, this.item})
      : super(key: key);

  @override
  _updateScreenState createState() => _updateScreenState();
}

class _updateScreenState extends State<updateScreen> {

  var db = DatabaseHelper();


  TextEditingController updatedEntry = TextEditingController();

  @override
  void initState() {
    super.initState();
    updatedEntry.text = "${widget.data}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Color(0xff004080 ),
        title: Text("Edit Entry"),
        actions: <Widget>[
         IconButton(
            icon: Icon(Icons.done_all),
            onPressed: () {
        _updateItem(widget.item, widget.index);
    var router= new MaterialPageRoute(
    builder: (BuildContext context){
    return Home();
    }
    );
    Navigator.of(context).pushReplacement(router);
    },
         ) ],
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.item.itemName}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: updatedEntry,
              scrollPadding: EdgeInsets.all(8),
              onEditingComplete: () {
              //  _saveMessage(widget.id, updatedEntry.text);
              },
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.newline,
              maxLines: 9999,
              autofocus: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: "Dear Diary,",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)),
            ),
          )
        ],
      ),
    );
  }


  _updateItem(NoDoItem item, int index) async{
            NoDoItem newItem= NoDoItem.fromMap({"itemName": item.itemName,
              "dateCreated": dateFormatted(0),
              "id": item.id,
              "day": item.day,
              "date": item.date,
              "time":item.time,
              "data": updatedEntry.text
            });
            await db.updateItem(newItem);// update in database

  }

}
