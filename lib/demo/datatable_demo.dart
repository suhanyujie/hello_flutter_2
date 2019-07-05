import 'package:flutter/material.dart';
import 'package:f_test2/model/post.dart';

class DatatableDemo extends StatefulWidget {
  @override
  _DatatableDemoState createState() => _DatatableDemoState();
}

class _DatatableDemoState extends State<DatatableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatatableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                  label: Text('title1')
                ),
                DataColumn(
                    label: Text('title2')
                ),
              ],
              rows: posts.map((item){
                return DataRow(
                  cells: [
                    DataCell(Text(item.title)),
                    DataCell(Text(item.author)),
                  ]
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
