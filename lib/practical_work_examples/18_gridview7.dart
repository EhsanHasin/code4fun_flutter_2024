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

  List items = [
    {'name':'foo', 'icon': Icons.ac_unit},
    {'name':'foo', 'icon': Icons.ac_unit},
    {'name':'foo', 'icon': Icons.ac_unit},
    {'name':'foo', 'icon': Icons.ac_unit},
    {'name':'foo', 'icon': Icons.ac_unit},
    {'name':'foo', 'icon': Icons.ac_unit},
    {'name':'foo', 'icon': Icons.ac_unit},
    {'name':'foo', 'icon': Icons.ac_unit},
  ];

  List names = [
    'foo',
    'bar',
    'baz',
    'foo',
    'bar',
    'baz',
    'foo',
    'bar',
    'baz',
    'foo',
    'bar',
    'baz'
  ];

  List icons = [
    Icons.add,
    Icons.ac_unit,
    Icons.add,
    Icons.ac_unit,
    Icons.add,
    Icons.ac_unit,
    Icons.add,
    Icons.ac_unit,
    Icons.add,
    Icons.ac_unit,
    Icons.add,
    Icons.ac_unit,Icons.add,
    Icons.ac_unit,


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          itemCount: names.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2), itemBuilder: (c,i){
        return Container(
          color: Colors.lightBlueAccent,
          child: Text(names[i]),
        );
      }),
    );
  }
}
