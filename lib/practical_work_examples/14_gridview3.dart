import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 7,
        children: [
          getGridTitle(),
          getGridTitle(),
          getGridTitle(),
          getGridTitle(),
          getGridTitle(),
        ],
      ),
    );
  }
  getGridTitle(){
    return GridTile(
      footer: Text('footer'),
      child: Container(
          color: Colors.redAccent, child: Center(child: Text('item'))),
    );
  }
}
