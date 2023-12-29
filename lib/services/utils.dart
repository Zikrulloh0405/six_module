import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class Utils {
  //! toats set up
  static void showToastFunc(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.blue,
        gravity: ToastGravity.BOTTOM);
  }
}

class LogService {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  void demo(String msg) {
    logger.d(msg);
    logger.i(msg);
    logger.w(msg);
    logger.e(msg);
    logger.t(msg);
  }
}
