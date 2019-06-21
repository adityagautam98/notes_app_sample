import 'package:flutter/material.dart';
import 'package:notes_app/globalVariables.dart' as data;
import 'package:flutter/services.dart';
import 'package:notes_app/model.dart';
import 'package:notes_app/updateScreen.dart';

class outputScreen extends StatefulWidget {
  final String title;
  final NoDoItem item;

  final int index;
  final String data;

  outputScreen({Key key, this.title, this.data, this.item, this.index})
      : super(key: key);

  @override
  _outputScreenState createState() => _outputScreenState();
}

class _outputScreenState extends State<outputScreen> {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: key,
        appBar: AppBar(
          backgroundColor: Color(data.Variables.AppBarColor),
          title: Text("My Diary"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.content_copy),
                onPressed: () {
                  Clipboard.setData(new ClipboardData(
                      text:
                          "${widget.item.itemName}\n" + "${widget.item.data}"));
                  final snackbar = new SnackBar(
                      content: new Text(
                        "Diary entry copied to Clipboard",
                        style: TextStyle(fontSize: 15),
                      ),
                      duration: new Duration(milliseconds: 1200),
                      backgroundColor: Colors.grey);
                  key.currentState.showSnackBar(snackbar);
                }),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  var router =
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return updateScreen(
                      title: widget.title,
                      data: widget.data,
                      index: widget.index,
                      item: widget.item,
                    );
                  });
                  Navigator.of(context).pushReplacement(router);
                }),
          ],
        ),
        body: GestureDetector(
            onLongPress: () {
              Clipboard.setData(new ClipboardData(
                  text: "${widget.item.itemName}\n" + "${widget.item.data}"));
              final snackbar = new SnackBar(
                  content: new Text(
                    "Diary entry copied to Clipboard",
                    style: TextStyle(fontSize: 15),
                  ),
                  duration: new Duration(milliseconds: 1200),
                  backgroundColor: Colors.grey);
              key.currentState.showSnackBar(snackbar);
            },
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: ListView(children: <Widget>[
                ListTile(
                  leading: Text(
                    "${widget.item.date.substring(0, 2)}",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 36,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w600),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.item.day}",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "${widget.item.dateCreated.substring(3, 13)}"
                            .toUpperCase(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[Text("${widget.item.time}")],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                  child: Text(
                    "${widget.title}",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Text(
                      "${widget.data}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ]),
            )));
  }
}
