import 'package:flutter/material.dart';

class NoDoItemNotes extends StatelessWidget {
  String _itemName;
  String _dateCreated;
  int _id;
  String _time;
  String _month;

  NoDoItemNotes(this._itemName, this._dateCreated, this._month, this._time);

  NoDoItemNotes.map(dynamic obj) {
    this._itemName = obj["itemName"];
    this._dateCreated = obj["dateCreated"];
    this._id = obj["id"];
    this._time = obj["time"];
    this._month = obj["month"];
  }

  String get itemName => _itemName;

  String get dateCreated => _dateCreated;

  int get id => _id;

  String get time => _time;

  String get month => _month;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["itemName"] = _itemName;
    map["dateCreated"] = _dateCreated;
    map["time"] = _time;
    map["month"] = _month;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  NoDoItemNotes.fromMap(Map<String, dynamic> map) {
    this._itemName = map["itemName"];
    this._dateCreated = map["dateCreated"];
    this._id = map["id"];
    this._time = map["time"];
    this._month = map["month"];
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
              Text(
                "$_itemName",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Text(
                  "Created On: $_dateCreated",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
