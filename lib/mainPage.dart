import 'package:flutter/material.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/dateFormatter.dart';
import 'package:notes_app/model.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController textEditingController = TextEditingController();
  var db = DatabaseHelper();
  final List<NoDoItem> _itemList = <NoDoItem>[];

  @override
  void initState() {
    super.initState();
    _readNoDoList();
  }

  void _handleSubmitted(String text) async {
    textEditingController.clear();
    NoDoItem noDoItem = NoDoItem(text, dateFormatted());
    int savedItemId = await db.saveItem(noDoItem);
    NoDoItem addedItem = await db.getItem(savedItemId);
    setState(() {
      _itemList.insert(0, addedItem);
    });
    print("Item saved id: $savedItemId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          new Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  reverse: false,
                  itemCount: _itemList.length,
                  itemBuilder: (_, int index) {
                    return Card(
                      color: Colors.grey.shade100,
                      child: ListTile(
                        title: _itemList[index],
                        onLongPress: () => _updateItem(_itemList[index], index),
                        trailing: Listener(
                          key: Key(_itemList[index].itemName),
                          child: Icon(
                            Icons.delete,
                          ),
                          onPointerDown: (pointerEvent) => _deleteNoDo(_itemList[index].id, index),// pointer down means the tap event has occured
                        ),
                      ),
                    );
                  })),
          Divider(
            height: 1.0,
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Add Item",
          backgroundColor: Colors.redAccent,
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
              controller: textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Items",
                  hintText: "ex- Dont do homework",
                  icon: Icon(Icons.note_add)),
            ),
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
          onPressed: () => Navigator.pop(context),
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
      NoDoItem noDoItem = NoDoItem.map(item);
      setState(() {
        _itemList.add(NoDoItem.map(item));
      });
      print("Db items: ${noDoItem.itemName}");
    });
  }

  _deleteNoDo(int id, int index) async{
    debugPrint("Deleted Item");
    await db.deleteItem(id);
    setState(() {
      _itemList.removeAt(index);
    });
  }

  _updateItem(NoDoItem item, int index) {
    var alert2 =new AlertDialog(
      title: Text("Update Item"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Item",
                hintText: "ex- Dont buy stuff",
                icon: Icon(Icons.update),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: ()async{
            NoDoItem newItem= NoDoItem.fromMap({"itemName": textEditingController.text,
            "dateCreated": dateFormatted(),
            "id": item.id});
            _handleSubmittedUpdate(index, item);//removed item from view, redrawing the screen
            await db.updateItem(newItem);// update in database
          setState(() {
            _readNoDoList(); // redrawing screen with updated database
          });
          textEditingController.clear();
          Navigator.pop(context);
          },
          child: Text("Update"),
        ),
        FlatButton(
          onPressed: ()=> Navigator.pop(context),
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(context: context,builder: (_){return alert2;});

  }

  void _handleSubmittedUpdate(int index, NoDoItem item) {

    setState(() {
      _itemList.removeWhere((element){
        _itemList[index].itemName== item.itemName; //the moment we click here, we remove item from list and if both  item name of index matches
        // with item name that we have submitted, then we are going right
      });
    });
  }
}
