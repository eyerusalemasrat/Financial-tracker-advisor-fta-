import 'package:flutter/material.dart';
import 'iconsWidget.dart';
import './iconsStateWidget.dart';



class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  var _count = 0;
  @override
  void _decrement() {
    setState(() {
      _count--;
      
    });
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercise"),
        ),
        body: IconsStateWidget(_count.toString(),_increment,_decrement),
      ),
    );
  }
}
