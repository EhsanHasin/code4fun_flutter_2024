import 'package:flutter/material.dart';
void main(){
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
  var sfn = '', ssn = '';
  var result = 0;
  var controller = TextEditingController();
  var myError = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Calculator", style: TextStyle(fontSize: 35, color: Colors.blue),),
            TextField(

              controller: controller,
              decoration: InputDecoration(hintText: "First Nubmer", errorText: myError),
              onChanged: (data){
                if(data.isNotEmpty){
                  setState(() {
                    myError = '';
                  });
                }
                // sfn = data;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "Second Nubmer"),
              onChanged: (data){
                ssn = data;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(onPressed: (){
                setState(() {
                  if(controller.text.isEmpty){
                    myError = 'first number should not be zero';
                    return;
                  }
                  int ifn = int.parse(controller.text);
                  int isn = int.parse(ssn);
                  result = ifn + isn;
                  // print(result);
                  controller.clear();
                });
              }, child: Text("Calculate ")),
            ),
            Text("Result = $result"),
          ],
        ),
      ),
    );
  }
}


