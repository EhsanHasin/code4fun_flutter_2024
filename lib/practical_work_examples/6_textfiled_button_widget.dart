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
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Registration Page", style: TextStyle(fontSize: 40, color: Colors.blue),),
                Row(children: [
                  Expanded(child: TextField(decoration: InputDecoration(hintText: "First Name", border: OutlineInputBorder()),)),
                  SizedBox(width: 10,),
                  Expanded(child: TextField(decoration: InputDecoration(hintText: "Last Name", border: OutlineInputBorder()),))
                ],),
                SizedBox(height: 10,),
                TextField(decoration: InputDecoration(hintText: "Phone Number", border: OutlineInputBorder()),),
                SizedBox(height: 10,),
                TextField(decoration: InputDecoration(hintText: "Password", border: OutlineInputBorder()), ),
                SizedBox(height: 10,),
                TextField(decoration: InputDecoration(hintText: "Re-Password", border: OutlineInputBorder()),),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(onPressed: (){}, child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Register", style: TextStyle(fontSize: 25),),
                  )),
                ),
                Text("I have an account!", style: TextStyle(color: Colors.lightBlueAccent),)
              ],
            ),
          ),
      ),
    );
  }
}
