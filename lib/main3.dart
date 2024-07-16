import 'package:flutter/material.dart';

void main() {
  runApp(const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "786",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 50, color: Colors.red),
      ),
      Text(
        "This is Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 40, color: Colors.green),
      ),
      Text(
        "Flutter is a UI toolkit developed by Google",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 30, color: Colors.purple),
      )
    ],
  ));
}
