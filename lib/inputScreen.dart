import 'package:notes_app/globalVariables.dart' as data;
import 'package:flutter/material.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/dateFormatter.dart';
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
  MediaQueryData queryData;

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Do you want to leave without saving your entry?'),
        content: new Text('Tap on save icon to save entry and return.'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  var db = DatabaseHelper();
  int savedId;

  TextEditingController dataEntry = TextEditingController();
  TextEditingController heading = TextEditingController();

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: _onWillPop,
    child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          backgroundColor: Color(data.Variables.AppBarColor),
          title: Text("New Dairy Entry"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _handleSubmitted(heading.text, dataEntry.text);
                heading.clear();
                dataEntry.clear();
                Navigator.pop(context);
                var router4 =
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return Home();
                });
                Navigator.of(context).pushReplacement(router4);
              },
            ),
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context);
                var router4 =
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return Home();
                });
                Navigator.of(context).pushReplacement(router4);
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.save),
              elevation: 10,
              backgroundColor: Color(data.Variables.AppBarColor),
              onPressed: () {
                _handleSubmitted(heading.text, dataEntry.text);
                heading.clear();
                dataEntry.clear();
                Navigator.pop(context);
                var router4 =
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return Home();
                });
                Navigator.of(context).pushReplacement(router4);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 8, 0, 2),
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10,0,0,0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    dateFormatted(2),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 36,
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w600),
                                  ),


                Container(
                  margin: EdgeInsets.fromLTRB(10,0,0,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dateFormatted(3),
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          dateFormatted(6).toUpperCase(),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),]),
                            ),
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Container(
                            child: Text(dateFormatted(1)),
                          )),
                      ],
                    ),
                  )]  ),])
                  ),
                ),
              Center(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(12, 2, 14, 5),
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
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                ),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 2, 14, 5),
                child: Container(
                  height: queryData.size.height*.5,
                  child: TextField(
                    maxLines: null,
                    enableInteractiveSelection: true,
                    controller: dataEntry,
                    scrollPadding: EdgeInsets.all(8),
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.newline,
                    autofocus: false,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration.collapsed(
                        hintText: "Dear Diary,",
                        hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _saveMessage(String id, String message) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(id, message);
  }

  void _handleSubmitted(String text, String entry) async {
    NoDoItem noDoItem = NoDoItem(text, entry, dateFormatted(1), dateFormatted(2), dateFormatted(3), dateFormatted(4), dateFormatted(5), dateFormatted(6));
    int savedItemId = await db.saveItem(noDoItem);
    savedId = savedItemId;
  }
}
