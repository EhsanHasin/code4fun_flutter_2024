import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 100, height: 100, color: Colors.purple,),
          Container(width: 100, height: 100, color: Colors.yellow,),
          Container(width: 100, height: 100, color: Colors.cyan,),
          Container(width: 100, height: 100, color: Colors.green,)
        ],
      ),
    ),
  ),
));