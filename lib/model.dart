import 'package:flutter/material.dart';

class NoDoItem extends StatelessWidget {
  String _itemName;
  String _dateCreated;
  int _id;
  String _date;
  String _time;
  String _day;
  String _data;

  NoDoItem(this._itemName, this._dateCreated, this._day, this._time, this._date,
      this._data);

  NoDoItem.map(dynamic obj) {
    this._itemName = obj["itemName"];
    this._dateCreated = obj["dateCreated"];
    this._day = obj["day"];
    this._time = obj["time"];
    this._date = obj["date"];
    this._data = obj["data"];
    this._id = obj["id"];
  }

  String get itemName => _itemName;

  String get dateCreated => _dateCreated;

  String get day => _day;

  String get time => _time;

  String get data => _data;

  String get date => _date;

  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["itemName"] = _itemName;
    map["dateCreated"] = _dateCreated;
    map["day"] = _day;
    map["time"] = _time;
    map["date"] = _date;
    map["data"] = _data;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  NoDoItem.fromMap(Map<String, dynamic> map) {
    this._itemName = map["itemName"];
    this._dateCreated = map["dateCreated"];
    this._day = map["day"];
    this._time = map["time"];
    this._date = map["date"];
    this._data = map["data"];
    this._id = map["id"];
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
            ],
          ),
        ],
      ),
    );
  }
}
