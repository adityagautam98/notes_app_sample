import 'package:notes_app/globalVariables.dart' as data;
import 'package:flutter/material.dart';
import 'package:notes_app/notesScreen/modelNotes.dart';
import 'package:flutter/services.dart';

class noteView extends StatefulWidget {
  final String title;
  final NoDoItemNotes item;
  final int index;

  noteView({Key key, this.title, this.item, this.index}) : super(key: key);

  @override
  _noteViewState createState() => _noteViewState();
}

class _noteViewState extends State<noteView> {
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    final key = new GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: key,// to use snackBar
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("${data.Variables.notepad}"),
                    fit: BoxFit.fill)),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Text(
                                        "${widget.item.dateCreated}",
                                        style: TextStyle(
                                            fontSize:
                                                38 / queryData.textScaleFactor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "${widget.item.month}",
                                          style: TextStyle(
                                              fontSize: 24 /
                                                  queryData.textScaleFactor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                    child: IconButton(
                                        icon: Icon(Icons.content_copy),
                                        splashColor: Colors.grey,
                                        onPressed: () {
                                          Clipboard.setData(new ClipboardData(
                                              text: "${widget.item.itemName}"));
                                          final snackbar = new SnackBar(
                                              content: new Text(
                                                "Copied to Clipboard",
                                                style: TextStyle(
                                                    fontSize: 15 /
                                                        queryData
                                                            .textScaleFactor),
                                              ),
                                              duration: new Duration(
                                                  milliseconds: 1200),
                                              backgroundColor: Colors.grey);
                                          key.currentState
                                              .showSnackBar(snackbar);
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 0, 0, 4),
                          child: Text(
                            "${widget.item.time}",
                            style: TextStyle(
                                fontSize: 15 / queryData.textScaleFactor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 8, 0, 0),
                          child: Text(
                            "${widget.item.itemName}",
                            style: TextStyle(
                                fontSize: 20 / queryData.textScaleFactor,
                                color: Color(0xff3a3a3a)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
