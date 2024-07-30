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
              child: Text("Click Me"),
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Hey for text")));
              },
            ),
            GestureDetector(
                child: Container(
              width: 200,
              height: 100,
              color: Colors.lightBlueAccent,
              child: Text("Long Click Me"),
            ),
              onLongPress: (){
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("long press on container")));
              },
            ),
            GestureDetector(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.lightBlueAccent,
                child: Text("Double Click Me"),
              ),
              onDoubleTap: (){
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Double click on container")));
              },
            ),
          ],
        ),
      ),
    );
  }
}
