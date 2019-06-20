import 'package:flutter/material.dart';
import 'package:notes_app/globalVariables.dart' as data;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/dateFormatter.dart';
import 'package:notes_app/notesScreen/noteViewpage.dart';
import 'databasenotes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'modelNotes.dart';

class notesPage extends StatefulWidget {
  @override
  _notesPage createState() => _notesPage();
}

class _notesPage extends State<notesPage> {
  bool _saveData;
  String saved= "Welcome to our App.\n"
      "Use it to store lists, your notes and everything else.\n"
      "Please tap to expand..\n\n\n\n"
      "Long press on Note Screen to update existing notes.\n";
  final TextEditingController textEditingController = TextEditingController();
  var db = DatabaseHelper();
  final List<NoDoItemNotes> _itemList = <NoDoItemNotes>[];

  @override
  void initState() {
    super.initState();
    _loadSavedState();
    _readNoDoList();
  }

  void _handleSubmitted(String text) async {
    NoDoItemNotes noDoItem = NoDoItemNotes(
        text, dateFormatted(4), dateFormatted(5), dateFormatted(2));
    int savedItemId = await db.saveItem(noDoItem);
    NoDoItemNotes addedItem = await db.getItem(savedItemId);
    setState(() {
      _itemList.insert(0, addedItem);
    });
    print("Item saved id: $savedItemId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          childAspectRatio: .85,
          mainAxisSpacing: 4,
          children: List.generate(_itemList.length, (index) {
            return Container(
             decoration:BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/noteclip1.png"),
            fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 3, 0, 4),
                child: ListTile(
                  onTap: () {
                    var router2 =
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return noteView(
                        title: _itemList[index].itemName.toString(),
                        item: _itemList[index],
                        index: index,
                      );
                    });
                    Navigator.of(context).push(router2);
                  },
                  onLongPress: () {
                    _updateItem(
                        _itemList[index], index, _itemList[index].itemName);
                  },
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(

                        child: Row( children: <Widget>[
                            Container(
                                child: Text(
                              "${_itemList[index].dateCreated}",
                                                            style: TextStyle(
                                  fontSize: 28,
                                  color: Color(0xff004466),
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            )),
                            Expanded(
                                child: Text(
                              "  ${_itemList[index].month}",
                              style: TextStyle(fontSize: 17),
                            )),
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _deleteNoDo(_itemList[index].id, index);
                                })
                          ],
                        ),
                      ),
                       Expanded(
                         child: Container(
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   AutoSizeText(
                                      "${_itemList[index].itemName}",
                                    maxLines: 7,  style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),

                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: AutoSizeText(
                                      "${_itemList[index].time}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ]),
                          ),
                       ),

                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Add Item",
          backgroundColor: Color(data.Variables.AppBarColor),
          child: new ListTile(
            title: new Icon(Icons.add),
          ),
          onPressed: _showFormDialog),
    );
  }

  void _showFormDialog() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
                maxLines: 8,
                controller: textEditingController,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: "NOTES",
                  hintText: "ex- A List",
                )),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            _handleSubmitted(textEditingController.text);
            textEditingController.clear();
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
        FlatButton(
          onPressed: () {
            textEditingController.clear();
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _readNoDoList() async {
    List items = await db.getItems();
    items.forEach((item) {
      NoDoItemNotes noDoItem = NoDoItemNotes.map(item);
      setState(() {
        _itemList.add(NoDoItemNotes.map(item));
      });
      print("Db items: ${noDoItem.itemName}");
    });
  }

  _deleteNoDo(int id, int index) async {
    debugPrint("Deleted Item");
    await db.deleteItem(id);
    setState(() {
      _itemList.removeAt(index);
    });
  }

  _updateItem(NoDoItemNotes item, int index, String text) {
    textEditingController.text = text;
    var alert2 = new AlertDialog(
      title: Text("Update Notes"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textEditingController,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 8,
              decoration: InputDecoration(
                labelText: "Notes",
                hintText: "ex- Add event",
                icon: Icon(Icons.update),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () async {
            NoDoItemNotes newItem = NoDoItemNotes.fromMap({
              "itemName": textEditingController.text,
              "dateCreated": item.dateCreated,
              "time": item.time,
              "month": item.month,
              "id": item.id
            });
            _handleSubmittedUpdate(
                index, item); //removed item from view, redrawing the screen
            await db.updateItem(newItem); // update in database
            setState(() {
              _readNoDoList(); // redrawing screen with updated database
            });
            textEditingController.clear();
            Navigator.pop(context);
          },
          child: Text("Update"),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert2;
        });
  }

  void _handleSubmittedUpdate(int index, NoDoItemNotes item) {
    setState(() {
      _itemList.removeWhere((element) {
        _itemList[index].itemName ==
            item.itemName; //the moment we click here, we remove item from list and if both  item name of index matches
        // with item name that we have submitted, then we are going right
      });
    });
  }

  _loadSavedState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {

      if (preferences.getBool("loading") != null ) {
        _saveData = preferences.getBool("loading");
      } else
        _saveData = true;
      if(_saveData){                              //Keep this down or savedData has to be initialised.
        _saveLoadState(false);
        _handleSubmitted(saved);
      }
      print(_saveData);
    });
  }

  _saveLoadState(bool toLoad) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("loading", toLoad);
  }
}
