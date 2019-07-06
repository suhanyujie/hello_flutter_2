import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject.listen((data)=>print(data));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value){
          _textFieldSubject.add("input: $value");
        },
        onSubmitted: (value){
          _textFieldSubject.add("submit: $value");
        },
        decoration: InputDecoration(
          labelText: "Text",
          filled: true,
        ),
      ),
    );
  }
}

