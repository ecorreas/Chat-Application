import 'package:flutter/material.dart';

class DefaultAlertDialog{
  static Future<void> show(BuildContext context, {
    required String message,
    bool barrierDismissible = false}){
    return showDialog(context: context,
    barrierDismissible: barrierDismissible,
     builder: (context){
       return new AlertDialog(
         contentPadding: EdgeInsets.all(10),
         content: Container(
           height: 50,
           width: 50,
           child: Center(child: Icon(Icons.warning, color: Colors.red))),
         title: Text(message),
       );
    });
  }

  static Future<dynamic> showLoading(BuildContext context, {bool barrierDismissible = false}){
    return showDialog(context: context,
    barrierDismissible: barrierDismissible,
     builder: (context){
       return new AlertDialog(
         contentPadding: EdgeInsets.all(10),
         content: Container(
           height: 50,
           width: 50,
           child: Center(child: CircularProgressIndicator())),
         title: Text('Connecting'),
       );
    });
  }
}