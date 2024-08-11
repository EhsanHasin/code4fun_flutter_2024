// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MaterialApp(
//     home: MyApp(),
//   ));
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         children: [
//           ListTile(
//             leading: Icon(Icons.ac_unit),
//             trailing: Icon(Icons.chevron_right),
//             title: Text('Titile'),
//             subtitle: Text("This is a sub titile"),
//             onTap: (){},
//           ),
//           ListTile(
//             leading: Icon(Icons.ac_unit),
//             trailing: Icon(Icons.chevron_right),
//             title: Text('Titile'),
//             subtitle: Text("This is a sub titile"),
//             onTap: (){},
//           ),
//           ListTile(
//             leading: Icon(Icons.ac_unit),
//             trailing: Icon(Icons.chevron_right),
//             title: Text('Titile'),
//             subtitle: Text("This is a sub titile"),
//             selected: true,
//             onTap: (){},
//           ),
//         ],
//       ),
//     );
//   }
// }


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.chevron_right),
              title: Text('Titile'),
              subtitle: Text("This is a sub titile"),
              onTap: (){},
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2, indent: 10, endIndent: 10, thickness: 0, color: Colors.lightBlueAccent,);
      },
      ),
    );
  }
}

