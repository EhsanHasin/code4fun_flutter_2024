import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: Scaffold(
    body: Container(
      margin: EdgeInsets.only(left: 20, top: 60),
      padding: EdgeInsets.all(30),
      color: Colors.purple,
      width: 200,
      height: 200,
      child: Text("data", style: TextStyle(color: Colors.white, fontSize: 35),),
    ),
  ),
));