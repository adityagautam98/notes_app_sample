import 'package:intl/intl.dart';

String dateFormatted(int type) {
  String output;
  var time = DateTime.now();
  var date = DateTime.now();
  var dayNameShort = DateTime.now();
  var monthNameFull = DateTime.now();
  var dateMonth = DateTime.now();
  var monthFullYear = DateTime.now();
  String timeDisplay = DateFormat("jm").format(time);
  String dateDisplay = DateFormat("d").format(date);
  String dayNameShortDisplay = DateFormat("EEE").format(dayNameShort);
  String monthNameFullDisplay = DateFormat("MMMM").format(monthNameFull);
  String dateMonthDisplay = DateFormat("d MMM").format(dateMonth);
  String monthFullYearDisplay = DateFormat("MMMM, y").format(monthFullYear);

  switch(type){
    case 1: output= timeDisplay;
    break;
    case 2: output= dateDisplay;
    break;
    case 3: output= dayNameShortDisplay;
    break;
    case 4: output= monthNameFullDisplay;
    break;
    case 5: output=dateMonthDisplay;
    break;
    case 6: output=monthFullYearDisplay;
    break;
  }
return output;
}
