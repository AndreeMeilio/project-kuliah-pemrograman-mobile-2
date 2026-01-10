
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {

  static final logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      errorMethodCount: 10,
      methodCount: 2,
      lineLength: 100,
      printEmojis: false,
      dateTimeFormat: DateTimeFormat.dateAndTime
    )
  );

  static void info({
    required String message,
    dynamic data
  }){
    if (kDebugMode){
      String outputMessage = "$message \n${data.toString()}";
      logger.i(outputMessage);
    }
  }

  static void error({
    required String error,
  }){
    if (kDebugMode){
      String outputMessage = error;
      logger.e(outputMessage);
    }
  }
}