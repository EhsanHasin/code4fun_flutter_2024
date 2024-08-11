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
  final List<Contact> items = [
    Contact(1, 'Foo', 'Fooe', '0799384958'),
    Contact(2, 'Bar', 'Bari', '0798394859'),
    Contact(3, 'Baz', 'Bazi', '0729839485'),
    Contact(4, 'Ahmad', 'Bazi', '0729839485'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact List"), backgroundColor: Colors.lightBlueAccent,),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var contact = items[index];
          return ListTile(
            leading: CircleAvatar(child: Text(contact.name[0], style: TextStyle(fontSize: 25),),),
            title: Text(contact.name + ' ' + contact.lastName),
            subtitle: Text(contact.phoneNumber),
            trailing: GestureDetector(
                onTap: (){
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Calling to ${contact.phoneNumber} ...😉'),
                      ),
                    );
                  });
                },
                child: Icon(Icons.phone, color: Colors.green,)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Calling to ${contact.phoneNumber} ...😉'),
                ),
              );
            },
          );
        }, separatorBuilder: (BuildContext context, int index) => Divider(height: 2,),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          items.add(Contact(items.length+1, 'Foo', 'Fooe', '0799384958'));
        });
      }, child: Icon(Icons.add),),
    );
  }
}

class Contact{
  var id;
  String name;
  String lastName;
  String phoneNumber;
  Contact(this.id, this.name, this.lastName, this.phoneNumber);
}