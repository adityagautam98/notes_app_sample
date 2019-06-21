import 'package:intl/intl.dart';

String dateFormatted(int type) {
  var daymonth = DateTime.now();
  var time = DateTime.now();
  var day = DateTime.now();
  var dayfull = DateTime.now();
  var date = DateTime.now();
  var monthyear = DateTime.now();
  var monthfull = DateTime.now();
  var displayDate = DateTime.now();
  String monthyeardisplay = DateFormat("MMMM y").format(monthyear);
  String monthNamefull = DateFormat("MMMM").format(monthfull);
  String timedisplay = DateFormat("jm").format(time);
  String display = DateFormat("d MMMM, y").format(displayDate);
  String dayformat = DateFormat("EEE").format(day);
  String dayfulldisplay = DateFormat("EEEE").format(dayfull);
  String daymonthdisplay = DateFormat("d MMM").format(daymonth);
  String datedisplay = DateFormat("d").format(date);
  if (type == 0) {
    return display;
  }
  if (type == 1) {
    return dayformat;
  }
  if (type == 3) {
    return daymonthdisplay;
  }
  if (type == 2) {
    return timedisplay;
  }
  if (type == 4) {
    return datedisplay;
  }
  if (type == 5) {
    return monthNamefull;
  }
  if (type == 6) {
    return dayfulldisplay;
  }
  if (type == 7) {
    return monthyeardisplay;
  }
}
