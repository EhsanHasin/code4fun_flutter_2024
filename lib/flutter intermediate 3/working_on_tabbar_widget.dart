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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabbar"),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.ac_unit), text: "one",),
            Tab(icon: Icon(Icons.add_circle_outline), text: "Two",),
            Tab(icon: Icon(Icons.access_time_outlined), text: "Three",),
          ]),
        ),
        body: TabBarView(children: [
          Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.blue,),
        ]),
      ),
    );
  }
}
