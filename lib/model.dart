import 'package:flutter/material.dart';
class NoDoItem extends StatelessWidget {
  String _itemName;
  String _dateCreated;
  int _id;


  NoDoItem(this._itemName, this._dateCreated);

  NoDoItem.map(dynamic obj){
this._itemName= obj["itemName"];
this._dateCreated= obj["dateCreated"];
this._id= obj["id"];
  }

  String get itemName=> _itemName;
  String get dateCreated=> _dateCreated;
  int get id=> _id;



Map<String, dynamic>toMap(){
  var map= Map<String, dynamic>();
  map["itemName"]= _itemName;
  map["dateCreated"]=_dateCreated;
  if(_id!=null) {
    map["id"] = _id;
  }
  return map;

}

NoDoItem.fromMap(Map<String, dynamic>map){
  this._itemName=  map["itemName"];
  this._dateCreated=  map["dateCreated"];
  this._id= map["id"];

}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text("$_itemName", style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500
              ) ,),

              Container(
                margin: EdgeInsets.fromLTRB(0,8,8,8),
                child: Text("Created On: $_dateCreated", style:
                  TextStyle(fontSize: 14, color: Colors.black54),),
              )
            ],
          ),

        ],
      ),
    );
  }
}
