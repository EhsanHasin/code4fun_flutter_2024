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
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3,
            mainAxisSpacing: 2,
            mainAxisExtent: 200),
        scrollDirection: Axis.vertical,
        reverse: false,
        children: [
          GridTile(
            header: Text("header"),
            footer: Center(child: Text('footer')),
            child: Container(
                color: Colors.redAccent, child: Center(child: Text('item'))),
          ),
          GridTile(child: Container(color: Colors.redAccent, child: Text('item'))),
          GridTile(child: Container(color: Colors.redAccent, child: Text('item'))),
          GridTile(child: Container(color: Colors.redAccent, child: Text('item'))),
        ],
      ),
    );
  }
}
