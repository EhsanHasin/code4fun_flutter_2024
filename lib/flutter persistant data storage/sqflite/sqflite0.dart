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
  late Database database;

  @override
  void initState() {
    super.initState();
  }

  openDB() async{
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/demo.db";

    // Delete the database
    // await deleteDatabase(path);

    // open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
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
                      openDB();
                    }, child: Text("Open DB")),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        myData = "";
                      });
                    }, child: Text("Clear UI")),
                    ElevatedButton(onPressed: () async{
                      await database.insert("Test", {'id': Random().nextInt(100), 'name': controller.text}, conflictAlgorithm: ConflictAlgorithm.ignore);
                      setState(() {
                        controller.clear();
                      });
                    }, child: Text("Save")),
                    ElevatedButton(onPressed: () async{
                      var temp = await database.query("Test", columns: ['id', 'name'], where: 'id = ?', whereArgs: [controller.text]);
                      for(var x in temp){
                        myData += '${x["id"]} : ${x["name"]} \n';
                      }
                      controller.clear();
                      setState(() {});
                    }, child: Text("Display by id")),
                    ElevatedButton(onPressed: ()async{
                      var temp = await database.query("Test", columns: ['id', 'name']);
                      for(var x in temp){
                        myData += '${x["id"]} : ${x["name"]} \n';
                      }
                      controller.clear();
                      setState(() {});
                    }, child: Text("Display all")),
                    ElevatedButton(onPressed: () async{
                      await database.delete("Test", where: 'id = ?', whereArgs: [controller.text]);
                    }, child: Text("Delete by id")),
                    ElevatedButton(onPressed: (){
                      var result =  database.delete("Test");
                      result.then((count) {
                        setState(() {
                          myData = "$count item is deleted";
                        });
                      });
                    }, child: Text("Delete all")),
                    ElevatedButton(onPressed: (){
                    }, child: Text("Edit by id")),

                  ],
                ),
                Text(myData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
