import 'package:flutter/material.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotePage(),
    );
  }
}

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final List<String> _notes = [];
  final TextEditingController _textController = TextEditingController();
  var errorMessage = '';
  void _addNote() {
    if(_textController.text.isEmpty){
      setState(() {
        errorMessage = "Enter Title";
      });
      return;
    }
    setState(() {
      _notes.add(_textController.text);
      _textController.clear();
    });
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter note',
                errorText: errorMessage
              ),
              onChanged: (text){
                if(text.isNotEmpty){
                  setState(() {
                    errorMessage = '';
                  });
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: _addNote,
            child: Text('Add Note'),
          ),
          _notes.isEmpty ? Expanded(child: Center(child: Text("Empty list 😔", style: TextStyle(fontSize: 30, color: Colors.grey),))) : Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(_notes[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteNote(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
