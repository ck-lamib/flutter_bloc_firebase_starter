import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///for toast message
class CustomSnackbar {
  static showToastMessage({
    required String message,
    Toast? toastLength,
    int timeInSecForIosWeb = 1,
    double? fontSize,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      timeInSecForIosWeb: timeInSecForIosWeb,
      fontSize: fontSize,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
