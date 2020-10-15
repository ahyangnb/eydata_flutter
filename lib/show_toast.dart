import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(text) {
  Fluttertoast.showToast(
    msg: text ?? '未知错误',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
