import 'package:flutter/material.dart';


class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['apple', 'banana', 'lemon'];

  String _actionName = 'Nothing';

  List<String> _filterChipValue = [];

  String _choiceChipVal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('篮球'),
                  backgroundColor: Colors.brown,
                ),
                Chip(
                  label: Text('足球'),
                  onDeleted: (){

                  },
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.red,
                  deleteButtonTooltipMessage: 'remote this item',
                ),
                Chip(
                  label: Text('羽毛球'),
                  avatar: Text('球'),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return Chip(
                      label: Text(tag),
                      onDeleted: (){
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  width: double.infinity,
                  child: Text('The ActionChip value is: $_actionName'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ActionChip(
                      label: Text(tag),
                      onPressed: (){
                        setState(() {
                          _actionName = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  width: double.infinity,
                  child: Text('The FilterChip value is: ${_filterChipValue.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return FilterChip(
                      label: Text(tag),
                      selected: _filterChipValue.contains(tag),
                      onSelected: (value){
                        setState(() {
                          if (_filterChipValue.contains(tag)) {
                            _filterChipValue.remove(tag);
                          } else {
                            _filterChipValue.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  width: double.infinity,
                  child: Text('The ChoiceChip value is: $_choiceChipVal'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choiceChipVal == tag,
                      onSelected: (value){
                        setState(() {
                         _choiceChipVal = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
            _filterChipValue = [];

            _choiceChipVal = "";
          });
        },
      ),
    );
  }
}
