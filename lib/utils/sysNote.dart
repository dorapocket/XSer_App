import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
Widget fuToast(String msg,Color color,BuildContext context) =>
    Flushbar(
      messageText: Text(
        msg,
        style: TextStyle(
            fontSize: 14.0, color: Colors.white),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      //显示位置
      icon: Icon(
        Icons.info_outline,
        size: 30.0,
        color: Colors.white,
      ),
      margin:EdgeInsets.all(8),
      borderRadius: 10,
      duration: Duration(seconds: 4),
      //显示时长
      //leftBarIndicatorColor: s ? Colors.green[400] : Colors.red[400],
      backgroundColor: color,
    )..show(context);
