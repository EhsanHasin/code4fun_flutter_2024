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
            Tooltip(message: "this is a tooltip", child: Text("tooltip 1")),
            Tooltip(
                verticalOffset: 40,
                height: 100,
                message: "this is a tooltip",
                child: Text("tooltip 2")),
            Tooltip(
              message: 'I am a Tooltip',
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                    colors: <Color>[Colors.amber, Colors.red]),
              ),
              height: 50,
              padding: const EdgeInsets.all(8.0),
              preferBelow: true,
              textStyle: const TextStyle(
                fontSize: 24,
              ),
              showDuration: const Duration(seconds: 2),
              waitDuration: const Duration(seconds: 1),
              child:
                  const Text('Tap this text and hold down to show a tooltip.'),
            )
          ],
        ),
      ),
    );
  }
}
