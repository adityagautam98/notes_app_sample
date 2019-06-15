import 'package:flutter/material.dart';
import 'package:notes_app/database.dart';
import 'package:notes_app/dateFormatter.dart';
import 'package:notes_app/inputScreen.dart';
import 'package:notes_app/model.dart';
import 'package:notes_app/outputScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController textEditingController = TextEditingController();
  var db = DatabaseHelper();
  final List<NoDoItem> _itemList = <NoDoItem>[];

  int savedId;

  @override
  void initState() {
    super.initState();
    _readNoDoList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: <Widget>[
          //Card(),
          new Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  reverse: false,
                  itemCount: _itemList.length,
                  itemBuilder: (_, int index) {
                    return Card(
                      color: Colors.grey.shade100,
                      child: ListTile(
                        leading: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text("${_itemList[index].day}", style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 13
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(_itemList[index].date, style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(_itemList[index].time, style: TextStyle(
                                    fontSize: 12
                                ),),
                              )
                            ],
                          ),
                        ),
                        title:
                        Padding(
                          padding: const EdgeInsets.only(top:12, bottom: 12),
                          child: Column(
                            children: <Widget>[
                              Container(child: Text("${_itemList[index].itemName}", style:
                                TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              alignment: Alignment.topLeft,),
                              Padding(
                                padding: const EdgeInsets.only(top:2.0),
                                child: Container(
                                  child: Text("${_itemList[index].data}", maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 15
                                  ),),
                                  alignment: Alignment.topLeft,
                                ),
                              )
                            ],
                          ),
                        ),
                        onLongPress: () => _updateItem(_itemList[index], index),
                        trailing: IconButton(
                            key: Key(_itemList[index].itemName),
                            icon: Icon(
                              Icons.delete,
                            ),
                            onPressed:() {
                              _deleteNoDo(_itemList[index].id, index);
                              // pointer down means the tap event has occured
                            }),
                        onTap: (){
                          String data= _itemList[index].data;
                          var router2= new MaterialPageRoute(
                              builder: (BuildContext context){
                                return outputScreen(title: _itemList[index].itemName.toString() , data: data, item: _itemList[index], index: index,);
                              }
                          );
                          Navigator.of(context).push(router2);

                        },
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
          backgroundColor: Color(0xff004d93),
          child: new ListTile(
            title: new Icon(Icons.add),
          ),
          onPressed:() {
            var router2 = new MaterialPageRoute(
                builder: (BuildContext context) {
                  return inputScreen();
                }
            );
            Navigator.of(context).pushReplacement(router2);
          }),
    );
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
              "dateCreated": dateFormatted(0),
              "id": item.id,
              "day": item.day,
              "date": item.date,
              "time":item.time,
              "data": item.data
            });
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
