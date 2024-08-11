import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Calculator"),),
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Text("+"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "786",
            style: TextStyle(fontSize: 50, color: Colors.red),
          ),
          Text(
            "This is Flutter",
            style: TextStyle(fontSize: 40, color: Colors.green),
          ),
          Text(
            "Flutter is a UI toolkit developed by Google",
            style: TextStyle(fontSize: 30, color: Colors.purple),
          )
        ],
      ),
    ),
  ));
}
