import 'package:flutter/material.dart';
import 'package:f_test2/demo/navigate_demo.dart';
import 'package:f_test2/demo/form_demo.dart';
import 'package:f_test2/demo/material_component.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/mdc',
      routes: {
        '/about': (context) => Page(
          title: 'About',
        ),
        '/': (context) => NavigateDemo(),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponent(),
      },
    );
  }
}
