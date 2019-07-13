import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoDoItem extends StatelessWidget {
  String _itemName;
  String _monthName;
  int _id;
  String _dateMonth;
  String _monthYear;
  String _date;
  String _time;
  String _day;
  String _data;

  NoDoItem(this._itemName, this._data, this._time, this._date, this._day, this._monthName, this._dateMonth, this._monthYear);

  NoDoItem.map(dynamic obj) {
    this._dateMonth= obj["dateMonth"];
    this._monthYear= obj["monthYear"];
    this._itemName = obj["itemName"];
    this._monthName = obj["monthName"];
    this._day = obj["day"];
    this._time = obj["time"];
    this._date = obj["date"];
    this._data = obj["data"];
    this._id = obj["id"];
  }

  String get itemName => _itemName;
String get dateMonth=> _dateMonth;
String get monthYear=> _monthYear;
  String get monthName => _monthName;
  String get day => _day;
  String get time => _time;
  String get data => _data;
  String get date => _date;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["itemName"] = _itemName;
    map["monthName"] = _monthName;
    map["day"] = _day;
    map["monthYear"]= _monthYear;
    map["time"] = _time;
    map["date"] = _date;
    map["dateMonth"] = _dateMonth;
    map["data"] = _data;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  NoDoItem.fromMap(Map<String, dynamic> map) {
    this._itemName = map["itemName"];
    this._monthName = map["monthName"];
    this._day = map["day"];
    this._dateMonth= map["dateMonth"];
    this._monthYear= map["monthYear"];
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
