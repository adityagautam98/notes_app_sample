import 'package:intl/intl.dart';
String dateFormatted(){
  var now= DateTime.now();
  var formatreq= new DateFormat("EEE, MMM d,''yy ");
  String formatted= formatreq.format(now);
  return formatted;
}