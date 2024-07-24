import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
          child: Text("Flutter in Code4Fun Class",
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ))),
    );
  }
}
