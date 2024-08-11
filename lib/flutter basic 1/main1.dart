
import 'package:flutter/material.dart';

void main(){
  Text t = Text("In the name of Allah", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 50.0, color: Colors.blue),);
  Center c = Center(child: t,);
  runApp(c);
}