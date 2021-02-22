import 'package:flutter/material.dart';
class IconWidget extends StatelessWidget {

  final String count;
  final Function increment;
  final Function decrement;
  IconWidget(this.count,this.increment,this.decrement);
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: increment
            ),
            Text(count),
            IconButton(
              icon: Icon(Icons.minimize),
              onPressed:decrement,
            ),
          ],
        ));
  }
}