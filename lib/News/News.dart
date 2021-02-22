import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      appBar: AppBar(
      title: Text('FTA'),
      actions: [
        Padding(
          padding: EdgeInsets.only(right:10.0),
          child: Icon(
            Icons.search,
            size: 28.0,
          ),


        ),
      Padding(padding: EdgeInsets.only(right: 10.0),
      child: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Row(children: [
              Icon(
                Icons.offline_bolt,
                color: Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Record'),
              )
              
            ],
            ),
          ),
          PopupMenuItem(
            child: Row(children: [
              Icon(
                Icons.offline_bolt,
                color: Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Advisor'),
              )
              
            ],
            ),
          ),
          PopupMenuItem(
            child: Row(children: [
              Icon(
                Icons.offline_bolt,
                color: Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('LogOut'),
              )
              
            ],
            ),
          )
        ],

      ),
      )
      ],
    ),);
}
}