
import 'package:flutter/material.dart';

void main(){
  var text786 = Text("786", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 50, color: Colors.red),);
  var textTitle = Text("This is Flutter", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 40, color: Colors.green),);
  var textDescription = Text("Flutter is a UI toolkit developed by Google", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 30, color: Colors.purple),);
  var col = Column(children: [text786, textTitle, textDescription], mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,);
  runApp(col);
}