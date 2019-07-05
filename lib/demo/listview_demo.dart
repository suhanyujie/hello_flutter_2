import 'package:flutter/material.dart';


class ListViewDemo extends StatelessWidget {
  Map _posts;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: _listItemBuilder
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            _posts[index].title,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}