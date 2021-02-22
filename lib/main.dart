import 'package:flutter/material.dart';
import 'package:login/register.dart';
import 'package:login/login.dart';
import 'package:login/record.dart';
import 'package:login/News/News.dart';
import 'package:http/http.dart' as http;

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
      routes: <String, WidgetBuilder> {
        '/news': (BuildContext context) => new News(),
        '/signup': (BuildContext context) => new Register(),
        '/record': (BuildContext context) => new Record()
      },
      home: MyHomePage(),

    );
  } 
}
