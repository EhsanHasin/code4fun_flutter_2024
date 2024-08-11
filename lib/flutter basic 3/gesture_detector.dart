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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Hey")));
                },
                child: Text("Click me")),
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you clicked on text")));
              },
                child: Text("Click Me")
            ),
            GestureDetector(
              onLongPress: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Container is long Pressed")));
              },
              child: Container(
                            width: 200,
                            height: 100,
                            color: Colors.lightBlueAccent,
                            child: Text("Long Click Me"),
                          ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onDoubleTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Container is double cliked")));
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.lightBlueAccent,
                child: Text("Double Click Me"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
