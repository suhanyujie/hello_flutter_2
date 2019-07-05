import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchValA = false;
  bool _switchTileVal = true;


  void _handleChange (value) {
    setState(() {
      _switchValA = value;
    });
  }

  void _handleSwitchTileChange (value) {
    setState(() {
      _switchTileVal = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              value: _switchTileVal,
              onChanged: _handleSwitchTileChange,
              title: Text('蓝色'),
              subtitle: Text('some description...'),
              secondary: Icon(_switchTileVal ? Icons.visibility : Icons.visibility_off),
              selected: _switchTileVal,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_switchValA ? '设置' : '不设置'),
                Switch(
                  value: _switchValA,
                  onChanged: _handleChange,
                ),

              ],
            ),

          ],
        )
      ),
    );
  }
}



