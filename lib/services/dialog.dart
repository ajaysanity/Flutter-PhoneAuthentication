import 'package:flutter/material.dart';

class DialogAlert{
  showLoaderDialog(BuildContext context, String message ){
    AlertDialog alert= AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 20.0),
                child:Text(message)),
          ),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  dismissDialog(context){
    Navigator.of(context).pop();

  }
}