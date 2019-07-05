import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;
  int _radioGroupB = 0;

  void _handleRadioChanged (int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  void _handleRadioTileChanged (int value) {
    setState(() {
      _radioGroupB = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioChanged,
                  activeColor: Colors.black,
                ),
                Radio(
                  value: 1,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioChanged,
                  activeColor: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('RadioTileGroupValue:$_radioGroupB'),
            SizedBox(
              height: 20.0,
            ),
            RadioListTile(
              value: 0,
              groupValue: _radioGroupB,
              onChanged: _handleRadioTileChanged,
              title: Text('冬天'),
              selected: _radioGroupB==0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupB,
              onChanged: _handleRadioTileChanged,
              title: Text('夏天'),
              selected: _radioGroupB==1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
    );
  }
}
