import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController controller = ScrollController();

  @override
  void initState() {

    controller.addListener(()=> print(controller.position));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        controller: controller,
        itemCount: 30,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemBuilder: (BuildContext context, int index) {
          return getGridTitle(index);
        },
      ),
    );
  }

  getGridTitle(index) {
    return GridTile(
      child: Container(
          color: Colors.redAccent, child: Center(child: Text('item $index', style: TextStyle(fontSize: 35, color: Colors.white),))),
    );
  }
}
