import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffolfKey = GlobalKey<ScaffoldState>();

  void _openBottomSheet () {
    _bottomSheetScaffolfKey
        .currentState
        .showBottomSheet((BuildContext context){
          return BottomAppBar(
            child: Container(
              height: 90.0,
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.pause_circle_outline),
                  SizedBox(),
                  Text('something'),
                  Expanded(
                    child: Text('1-1',textAlign: TextAlign.right,),
                  ),
                ],
              ),
            ),
          );
    });
  }

  void _openBottomModalSheet () {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('男'),
              ),
              ListTile(
                title: Text('女'),
              ),
              ListTile(
                title: Text('其他'),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffolfKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Wrap 一般是在 Column 中使用，在列中才能换行！
            Wrap(
              children: <Widget>[
                FlatButton(
                  onPressed: _openBottomSheet,
                  child: Text('openBottomSheet'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                FlatButton(
                  onPressed: _openBottomModalSheet,
                  child: Text('openBottomModalSheet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
