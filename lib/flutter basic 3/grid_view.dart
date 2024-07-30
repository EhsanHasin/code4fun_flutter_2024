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
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
          GridTile(child: Text("flutter"),),
        ],
      ),
    );
  }
}
