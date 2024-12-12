import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  var data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: keyController,
                decoration: InputDecoration(hintText: "key"),
              ),
              TextField(
                controller: valueController,
                decoration: InputDecoration(hintText: "value"),
              ),
              ElevatedButton(onPressed: () async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString(keyController.text, valueController.text);
              }, child: Text("save")),
              ElevatedButton(onPressed: () async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                final String? action = prefs.getString(keyController.text);
                setState(() {
                  data = action ?? "empty | null";
                });
              }, child: Text("restore")),
              Text(data)
            ],
          ),
        ),
      ),
    );
  }
}
