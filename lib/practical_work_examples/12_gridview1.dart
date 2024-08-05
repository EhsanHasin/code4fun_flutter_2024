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
            mainAxisExtent: 200,
            childAspectRatio: 50),
        scrollDirection: Axis.vertical,
        reverse: false,
        children: [
          Container(
            height: 100,
            child: Text('item1'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item2'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item3'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
          Container(
            height: 100,
            child: Text('item'),
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
