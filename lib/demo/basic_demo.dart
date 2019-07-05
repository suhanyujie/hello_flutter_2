import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _contentStyle = TextStyle(
      fontSize: 20.0,
      wordSpacing: 0,
    );
    // TODO: implement build
    return Container(
      // color: Colors.purple[200],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://resources.ninghao.org/images/say-hello-to-barry.jpg"),
          alignment: Alignment.topCenter,
//          repeat: ImageRepeat.repeatY,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.purple[200],
            BlendMode.hardLight,
          )
        ),
      ),
      child: Row(
        children: <Widget>[
          Text(
            "hello basic",
            style: _contentStyle,
          ),
          Container(
            child: Icon(Icons.directions_bike,
              size: 70.0,
            ),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(12, 54, 255, 1.0),
              border: Border.all(),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ],
      ),

    );
  }
}
