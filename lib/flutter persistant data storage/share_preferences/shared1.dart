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
  TextEditingController controller = TextEditingController();
  var data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(onPressed: () async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString("myData", controller.text);
            }, child: Text("save")),
            ElevatedButton(onPressed: () async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              final String? action = prefs.getString('myData');
              setState(() {
                data = action ?? "empty | null";
              });
            }, child: Text("restore")),
            Text(data)
          ],
        ),
      ),
    );
  }
}
