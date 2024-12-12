// Import necessary packages
import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON encoding and decoding
import 'dart:io'; // For file operations
import 'package:path_provider/path_provider.dart'; // For accessing the app's storage

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatefulWidget {
  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    // Initially for this demo, we set loggedIn as true directly, but this can be changed with real login logic.
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoggedIn ? HomePage() : SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> notes = [];
  late File _notesFile;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  // Get the directory and file for storing notes
  Future<File> _getNotesFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/notes.json');
  }

  // Load notes from the file
  _loadNotes() async {
    _notesFile = await _getNotesFile();
    if (await _notesFile.exists()) {
      String content = await _notesFile.readAsString();
      List<dynamic> jsonData = json.decode(content);
      setState(() {
        notes = List<Map<String, String>>.from(jsonData);
      });
    }
  }

  // Save notes to the file
  _saveNotes() async {
    String jsonString = json.encode(notes);
    await _notesFile.writeAsString(jsonString);
  }

  // Add new note to the list and file
  _addNewNote() async {
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewNotePage()),
    );
    if (newNote != null) {
      setState(() {
        notes.add(newNote);
      });
      _saveNotes();
    }
  }

  // Logout Logic (Reset notes on logout if needed)
  _logout() async {
    // Handle logout logic here, like clearing shared preferences
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Open Settings Page
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]['title']!),
            subtitle: Text(notes[index]['description']!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewNote,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddNewNotePage extends StatefulWidget {
  @override
  _AddNewNotePageState createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  _saveNote() {
    String title = titleController.text;
    String description = descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      Navigator.pop(context, {'title': title, 'description': description});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Note')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
