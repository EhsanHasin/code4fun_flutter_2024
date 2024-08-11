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
      body: GridView.builder(
        itemCount: 30,
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemBuilder: (BuildContext context, int index) {
          return getGridTitle(index);
        },
      ),
    );
  }

  getGridTitle(index) {
    return GridTile(
      child: Container(
          color: Colors.redAccent, child: Center(child: Text('item $index', style: TextStyle(fontSize: 35, color: Colors.white),))),
    );
  }
}
