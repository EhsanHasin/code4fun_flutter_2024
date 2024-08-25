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
  var size;
  var color;
  @override
  void initState() {
    size = 100;
    color = Colors.green;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: Text("This is an Animated Container"),
            width: size,
            height: size,
            color: color,
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              // size = size + 100;
              size += 50;
              color = Colors.red;
            });
          }, child: Text("Change"))
        ],
      ),
    );
  }
}
