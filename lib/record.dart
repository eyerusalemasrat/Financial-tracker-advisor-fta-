import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Record extends StatefulWidget {
  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children : <Widget>[
          Text(_dateTime == null ? 'noting has been picked yet : ': _dateTime.toString()),
          RaisedButton(child: Text('pick a date'),
          onPressed: () {
            showDatePicker(context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime(2222)
            ).then((date){
              setState((){
                _dateTime = date;
              });
            });
          },
          ),
          TextField(
            decoration: new InputDecoration(labelText: "Enter your income"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
  FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
          ),
          Text('Expenses'),
          TextField(
            decoration: new InputDecoration(labelText: "Enter your Medical Expenses"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
  FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
          ),
          TextField(
            decoration: new InputDecoration(labelText: "Enter your Medical Food"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
  FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
          ),
          TextField(
            decoration: new InputDecoration(labelText: "Enter your Medical Transportation"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
  FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
          ),
          TextField(
            decoration: new InputDecoration(labelText: "Enter your Medical Bills"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
  FilteringTextInputFormatter.digitsOnly
], // Only numbers can be entered
          ),
          
        ],
      ),
    );
}
}