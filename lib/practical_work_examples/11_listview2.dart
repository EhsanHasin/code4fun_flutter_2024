import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Example',
      home: MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<Map<String, dynamic>> items = List<Map<String, dynamic>>.generate(
    5,
        (index) => {
      'title': 'Item $index',
      'subtitle': 'This is the subtitle for item $index',
      'icon': Icons.delete,
      'image': 'assets/images/im2.jpg'
    },
  );

  final List<int> numbers = List.generate(10, (i)=> ++i * 1000);

  @override
  void initState() {
    super.initState();
    numbers.add(12);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View"), backgroundColor: Colors.amber,),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(item['image']),
              title: Text('${item['title']}'),
              subtitle: Text('${item['subtitle']}'),
              trailing: GestureDetector(
                  onTap: (){
                    setState(() {
                      items.removeAt(index);
                      print("done $index");
                    });
                  },
                  child: Icon(item['icon'], color: Colors.red,)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped on ${items[index]['title']}'),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          items.add({
            'title': 'Item ${items.length}',
            'subtitle': 'This is the subtitle for item ${items.length}',
            'icon': Icons.delete,
            'image': 'assets/images/im2.jpg'
          });
        });
      }, child: Icon(Icons.add),),
    );
  }
}
