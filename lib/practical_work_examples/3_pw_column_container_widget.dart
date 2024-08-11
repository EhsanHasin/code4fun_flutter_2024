import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  var s = 200.0;
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.green,
            width: s,
            height: s,
            child: Center(
              child: Text("Container #1",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          Container(
            color: Colors.blue,
            width: s,
            height: s,
            child: Center(
              child: Text("Container #2",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          Container(
            color: Colors.red,
            width: s,
            height: s,
            child: Center(
              child: Text("Container #3",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
