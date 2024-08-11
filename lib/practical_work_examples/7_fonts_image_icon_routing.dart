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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is an Icon "),
              Icon(Icons.ac_unit_sharp, size: 40, color: Colors.green,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is an Image "),
              Image.asset('assets/images/im2.jpg', width: 100,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is my Custom Font "),
              Text("Flutter is Awesome 😉", style: TextStyle(fontFamily: "baby"),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This routing Example "),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Click to Exit from App"))
            ],
          ),
        ],
      ),
    );
  }
}
