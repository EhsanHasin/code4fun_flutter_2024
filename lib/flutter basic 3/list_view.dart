import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
          ListTile(title: Text("flutter"),),
        ],
      ),
    );
  }
}
