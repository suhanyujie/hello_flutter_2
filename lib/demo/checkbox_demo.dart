import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkboxA = true;
  bool _checkboxB = true;
  bool _checkboxB_2 = true;
  bool _checkboxB_3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxA,
                  onChanged: (value) {
                    setState(() {
                      _checkboxA = value;
                    });
                  },
                  activeColor: Colors.black,
                ),
              ],
            ),
            CheckboxListTile(
              title: Text('足球'),
              value: _checkboxB,
              selected: _checkboxB,
              onChanged: (value){
                setState(() {
                  _checkboxB = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('篮球'),
              value: _checkboxB_2,
              selected: _checkboxB_2,
              onChanged: (value){
                setState(() {
                  _checkboxB_2 = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('羽毛球'),
              value: _checkboxB_3,
              selected: _checkboxB_3,
              onChanged: (value){
                setState(() {
                  _checkboxB_3 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
