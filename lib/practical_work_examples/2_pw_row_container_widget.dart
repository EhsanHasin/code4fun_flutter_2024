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
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.green,
                width: 200,
                height: 200,
                child: Center(
                  child: Text("Container #1",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
              Container(
                color: Colors.blue,
                width: 150,
                height: 150,
                child: Center(
                  child: Text("Container #2",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
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
