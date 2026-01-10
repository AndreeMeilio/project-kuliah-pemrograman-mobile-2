import 'package:intl/intl.dart';

class AppDateFormat{
  static dd4m4y(DateTime time){
    return DateFormat("dd MMMM yyyy").format(time);
  }
}