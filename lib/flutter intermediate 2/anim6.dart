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

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.forward();
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            AnimatedIcon(
              size: 70,
                color: Colors.green,
                icon: AnimatedIcons.play_pause,
                progress: controller),
            ElevatedButton(onPressed: (){
              controller.reverse();
            }, child: Text("back"))
          ],
        ),
      ),
    );
  }
}
