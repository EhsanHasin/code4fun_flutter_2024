import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
          children: [
            ElevatedButton(onPressed: ()async{
              var dir = await getApplicationDocumentsDirectory();
              var file = File(dir.path+"/myFile.txt");
              await file.writeAsString("786");
            }, child: Text('save')),
            ElevatedButton(onPressed: () async{
              var dir = await getApplicationDocumentsDirectory();
              var file = File(dir.path+"/myFile.txt");
              String s = await file.readAsString();
              print(s);
            }, child: Text('get')),
          ],
        ),
      ),
    );
  }
}
