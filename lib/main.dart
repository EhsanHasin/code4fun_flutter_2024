import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity, height: double.infinity,color: Colors.lightBlueAccent, child: Center(child: Text("Tap to change Color", style: TextStyle(fontSize: 50),)),),
    );
  }
}
