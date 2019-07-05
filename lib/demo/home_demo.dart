import 'package:flutter/material.dart';
import 'draw_demo.dart';
import 'basic_demo.dart';
import 'list_demo.dart';

class HomeDemo extends StatelessWidget {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.list),
            onPressed: ()=>debugPrint("leading btn is pressed..."),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist),),
              Tab(icon: Icon(Icons.change_history),),
              Tab(icon: Icon(Icons.directions_bike),),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.local_florist,size: 128, color: Colors.black12),
            BasicDemo(),
            Icon(Icons.directions_bike,size: 128, color: Colors.black12),
          ],
        ),
        drawer: DrawDemo(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curIndex,
          onTap: _onTapHandler,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("ss"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text("History"),
            ),
          ],
        ),
      ),
    );
  }

  int _onTapHandler(int index) {
    _curIndex = index;
  }
}