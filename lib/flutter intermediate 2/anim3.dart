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

  var p = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPadding(
                duration: Duration(seconds: 1),
                padding: EdgeInsets.only(top: p),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.orange,
                )),
            ElevatedButton(onPressed: () {
              setState(() {
                p += 20;
              });
            }, child: Text("Change")),
          ],
        ),
      ),
    );
  }
}
