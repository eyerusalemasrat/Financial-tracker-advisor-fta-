import 'package:flutter/material.dart';
class IconsStateWidget extends StatefulWidget {
 
  final String count;
  final Function increment;
  final Function decrement;
  IconsStateWidget(this.count,this.increment,this.decrement);
  @override
  _IconsStateWidgetState createState() => _IconsStateWidgetState();
}

class _IconsStateWidgetState extends State<IconsStateWidget> {
  var color=Colors.greenAccent;
  @override
   Widget build(BuildContext context) {
    return Container(
            child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                  widget.increment();
                 if( int.parse(widget.count)>=-1){
                  setState(() {
                    color=Colors.purple as MaterialAccentColor;
                  });
               
                }
                
              
              }
            ),
            Text(widget.count,style: TextStyle(color: color),),
            IconButton(
              icon: Icon(Icons.minimize,),
              onPressed:(){
                   widget.decrement();
                if( int.parse(widget.count)==0){
                  setState(() {
                    color=Colors.red as MaterialAccentColor;
                  });
                  

                }
         
              }
                
            ),
          ],
        ));
  }
}