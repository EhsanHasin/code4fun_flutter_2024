import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Flutter in",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue
                        )),
                  ),
                  Center(
                    child: Text(" Code4Fun",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green
                        )),
                  ),
                  Center(
                    child: Text(" is Great",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple
                        )),
                  ),
                  Center(
                    child: Text(" ❤️",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text("Flutter in",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue
                        )),
                  ),
                  Center(
                    child: Text(" Code4Fun",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green
                        )),
                  ),
                  Center(
                    child: Text(" is Great",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple
                        )),
                  ),
                  Center(
                    child: Text(" ❤️",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
