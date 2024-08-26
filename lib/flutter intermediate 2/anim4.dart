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
  var t,l;
  @override
  void initState() {
    t = 0;
    l = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(width: 400, height: 200, color: Colors.blue,),
            AnimatedPositioned(
              curve: Curves.bounceOut,
              top: t,
                left: l,
                duration: Duration(milliseconds: 400),
                child: Container(width: 150, height: 100, color: Colors.red,)
            ),
            Container(width: 50, height: 500, color: Colors.green,),
            Positioned(
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      l -= 50;
                    });
                  }, child: Text("👈")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      l += 50;
                    });
                  }, child: Text("👉")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      t -= 50;
                    });
                  }, child: Text("top")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      t += 50;
                    });
                  }, child: Text("bottom")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
