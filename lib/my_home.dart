import 'package:flutter/material.dart';

main() {
  var c = Container(
    width: 200,
    height: 200,
    color: Colors.deepPurple,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '786',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 50, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        Text(
          'This is Flutter',
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
        Text(
          'flutter is a UI tookit developed by Google ',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
      ],
    ),
  );

  runApp(c);
}
