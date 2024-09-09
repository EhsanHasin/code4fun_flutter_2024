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
  var chiled1 = Container(
    key: Key("one"),
    width: 300,
    height: 300,
    color: Colors.green,
  );
  var chiled2 = Container(
    key: Key("two"),
    width: 200,
    height: 600,
    color: Colors.yellow,
  );
  var defaultChiled;

  @override
  void initState() {
    defaultChiled = chiled1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: defaultChiled),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  defaultChiled = defaultChiled == chiled1 ? chiled2 : chiled1;
                });
              },
              child: Text("switch"),
            ),
          ],
        ),
      ),
    );
  }
}
