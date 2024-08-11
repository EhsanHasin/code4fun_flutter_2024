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
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text("Title: 1"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text("Title: 2"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("Title: 3"),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text("Title: 4"),
            leading: Icon(Icons.face),
            iconColor: Colors.amber,
            textColor: Colors.blue,

          )
        ],
      ),
    );
  }
}
