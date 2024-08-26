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

  var opc = 0.1;
  var opc2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
                opacity: opc,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.orange,
                )),
            ElevatedButton(onPressed: () {
              setState(() {
                print(opc);
                if(opc <= 0.9){
                  opc += 0.1;
                }
              });
            }, child: Text("Change")),
            AnimatedOpacity(
                opacity: opc2,
                duration: Duration(seconds: 1),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                )),
            ElevatedButton(onPressed: () {
              setState(() {
                // if(opc2 == 0.0)x
                //   opc2 = 1.0;
                // else
                //   opc2 = 0.0;

                opc2 = opc2 == 0.0 ? 1.0 : 0.0;
              });
            }, child: Text("Change"))
          ],
        ),
      ),
    );
  }
}
