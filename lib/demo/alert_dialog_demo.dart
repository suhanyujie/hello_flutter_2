import 'package:flutter/material.dart';
import 'dart:async';

enum Action {
  Ok,Cancel,Nothing
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  Action _resAction = Action.Nothing;

  // 显示对话框 使用 showDialog 函数
  _showSimpleDialog () async {
    Action res = await showDialog(
      context: context,
      barrierDismissible: false,// 强制用户必须选择一个按钮
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialogDemo...'),
          content: Text('are you sure about this ?'),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pop(context, Action.Cancel);
              },
              child: Text('Cancel'),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context, Action.Ok);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );

    setState(() {
      _resAction = res;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('${_resAction.toString()}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _showSimpleDialog,
      ),
    );
  }
}

