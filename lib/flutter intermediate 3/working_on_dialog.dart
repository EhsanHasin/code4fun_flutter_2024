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
        child: ElevatedButton(onPressed: (){
          showDialog(context: context, builder:(c)=> AlertDialog(
            title: Text("Do you want to exit?"),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Yes")),
              ElevatedButton(onPressed: (){}, child: Text("No")),
            ],
          )
          );
        }, child: Text("Show Dialog")),
      ),
    );
  }
}
