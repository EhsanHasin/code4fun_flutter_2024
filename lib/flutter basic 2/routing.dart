import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(

    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)=> SecondPage(id: 4000)));
       }, child: Text("Go to Second Page")),)
    );
  }
}


class SecondPage extends StatelessWidget {

  var id, name, phone;

  SecondPage({super.key, this.id, this.name, this.phone });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("second page with id = $id", style: TextStyle(fontSize: 35),)),
    );
  }
}



