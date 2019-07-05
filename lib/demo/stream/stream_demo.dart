import 'dart:async';
import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamDemoSubscription;

  // stream 控制器
  StreamController<String> _streamDemo;

  String _data = '...';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("create a stream");
    // _streamDemo = StreamController.broadcast();// 多次订阅的方法
    _streamDemo = StreamController<String>();
    // Stream<String> _streamDemo = _streamDemo.fromFuture(fetchData());
    _streamDemoSubscription = _streamDemo.stream.listen(onData,onDone: onDone, onError: onError);
  }

  void addDataToStream() async {
    setState(() {
      _data = "请稍后...";
    });
    String data = await fetchData();
    _streamDemo.add(data);
  }

  void onData (String data) {
    print(data);
    setState(() {
      _data = data;
    });
  }

  void onDone() {
    print("It's done.");
  }

  void onError(error) {
    print("error happen");
    setState(() {
      _data = "error happen";
    });
  }

  void _streamPause () {
    if (_streamDemoSubscription != null)
      _streamDemoSubscription.pause();
    print("stream pasue");
  }

  void _streamResume() {
    if (_streamDemoSubscription != null)
      _streamDemoSubscription.resume();
    print("stream resume");
  }

  void _streamCancel(){
    if (_streamDemoSubscription != null)
      _streamDemoSubscription.cancel();
    print("stream cancel");
  }

  Future<String> fetchData () async {
    await Future.delayed(Duration(seconds: 3));
    return "hello world";
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$_data'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: addDataToStream,
                child: Text('add'),
              ),
              FlatButton(
                onPressed: _streamPause,
                child: Text('pause'),
              ),
              FlatButton(
                onPressed: _streamResume,
                child: Text('resume'),
              ),
              FlatButton(
                onPressed: _streamCancel,
                child: Text('cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}

