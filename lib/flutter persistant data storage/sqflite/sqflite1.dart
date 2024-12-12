import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

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
  TextEditingController controller = TextEditingController();
  var myData = "";
  late Database db;

  //CRUD

  //DDL
  //DML

  _openDatabase()async{
    var path = await getDatabasesPath();
    db = await openDatabase(
        '$path/contacts.db',
        version: 1,
      onCreate: (db, v)async{
        await db.execute('CREATE TABLE Students(id integer,name text,age integer);');
      }
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _openDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Sqflite"),
              TextField(controller: controller, decoration: InputDecoration(hintText: "Enter ..."),),
              Wrap(
                spacing: 5.0,
                children: [
                  ElevatedButton(onPressed: (){
                    _openDatabase();
                  }, child: Text("Open DB")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      myData = '';
                    });
                  }, child: Text("Clear UI")),
                  ElevatedButton(onPressed: () async{
                    // await db.rawInsert("INSERT INTO Students (id, name, age)VALUES (1, 'foo', 12);");
                    await db.insert('Students', {'id': Random().nextInt(100).toInt(), 'name': controller.text}, conflictAlgorithm: ConflictAlgorithm.replace);
                    setState(() {
                      controller.clear();
                    });
                  }, child: Text("Save")),
                  ElevatedButton(onPressed: () async{
                    List<Map<String,dynamic>> rows = await db.query("Students", where: 'id = ?', whereArgs: [controller.text]);
                    setState(() {
                      for(Map row in rows){
                        var i = row['id'];
                        var n = row['name'];
                        myData += "id = $i  name = $n \n";
                      }
                    });
                  }, child: Text("Display by id")),
                  ElevatedButton(onPressed: ()async{
                    // List<Map<String,dynamic>> rows = await db.rawQuery('select * from Students;');
                    List<Map<String,dynamic>> rows = await db.query("Students");
                    setState(() {
                      for(Map row in rows){
                        var i = row['id'];
                        var n = row['name'];
                        myData += "id = $i  name = $n \n";
                      }
                    });
                  }, child: Text("Display all")),
                  ElevatedButton(onPressed: () async{
                    await db.delete("Students", where: "id = ${controller.text}");
                  }, child: Text("Delete by id")),
                  ElevatedButton(onPressed: ()async{
                    int numberOfRows = await db.delete("Students");
                   if(numberOfRows>0){
                     setState(() {
                       myData = "$numberOfRows rows are deleted";
                     });
                   }else{
                     setState(() {
                       myData = "nothing to delete";
                     });
                   }

                  }, child: Text("Delete all")),
                  ElevatedButton(onPressed: (){
                    // db.update(table, values, w)
                  }, child: Text("Edit by id")),
                ],
              ),
              Text(myData),
            ],
          ),
        ),
      ),
    );
  }
}
