import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Example'),
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<String> items = List<String>.generate(20, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Icon(Icons.chevron_right),
          leading: Icon(Icons.list),
          title: Text('${items[index]}'),
          tileColor: Color.fromARGB(Random().nextInt(250), Random().nextInt(250), Random().nextInt(250), 1),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tapped on ${items[index]}'),
              ),
            );
          },
        );
      },
    );
  }
}
