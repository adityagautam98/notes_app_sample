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
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: key,
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/noteback.png"),
                    fit: BoxFit.fill)),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0) ,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Text(
                                          "${widget.item.dateCreated}",
                                          style: TextStyle(fontSize: 38),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            "${widget.item.month}",
                                            style: TextStyle(fontSize: 18),
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
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                duration: new Duration(
                                                    milliseconds: 1200),
                                                backgroundColor: Colors.grey);
                                            key.currentState.showSnackBar(snackbar);
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
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 8, 0, 0),
                          child: Text(
                            "${widget.item.itemName}",
                            style:
                                TextStyle(fontSize: 20, color: Color(0xff3a3a3a)),
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
