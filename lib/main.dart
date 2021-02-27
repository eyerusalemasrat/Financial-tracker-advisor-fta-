import 'package:flutter/material.dart';
import 'package:FTA/Screen/loginScreen.dart';
import 'package:FTA/Screen/registerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new Register()
      },
      home: MyHomePage(),
    );
  }
}
