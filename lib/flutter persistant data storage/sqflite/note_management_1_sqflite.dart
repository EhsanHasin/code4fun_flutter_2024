// Import Flutter and necessary packages
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatefulWidget {
  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  bool isLoggedIn = false;
  bool isDarkMode = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loggedIn = prefs.getBool('isLoggedIn');
    bool? darkMode = prefs.getBool('darkMode');
    setState(() {
      isLoggedIn = loggedIn ?? false;
      isDarkMode = darkMode ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: isLoggedIn ? HomePage() : SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.getBool(MyConstant.isLoggedIn.name);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ?? false ? HomePage() : LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: Text('Splash Screen', style: TextStyle(fontSize: 24))),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(MyConstant.isLoggedIn.name, true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> notes = [];

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashScreen()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
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
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewNotePage()));
        },
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

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  double fontSize = 14;
  String language = 'English';

  _toggleDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode;
      prefs.setBool('darkMode', isDarkMode);
    });
  }

  _changeFontSize(double value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fontSize = value;
    await prefs.setDouble('fontSize', fontSize);
    setState(() {});
  }

  _changeLanguage(String newLanguage) {
    setState(() {
      language = newLanguage;
    });
  }

  _getCurrentDarkMode() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      bool? temp = pref.getBool("darkMode");
      isDarkMode = temp ?? false;
    });
  }

  _getCurrentFontSize() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      double? temp = pref.getDouble("fontSize");
      fontSize = temp ?? 12;
    });
  }

  @override
  void initState() {
    _getCurrentDarkMode();
    _getCurrentFontSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: isDarkMode,
              onChanged: (value) async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                isDarkMode = !isDarkMode;
                await prefs.setBool('darkMode', isDarkMode);
                setState((){
                  print(isDarkMode);
                });
              },
            ),
            ListTile(
              title: Text('Font Size'),
              subtitle: Slider(
                divisions: 3,
                value: fontSize,
                min: 12,
                max: 24,
                onChanged: (value) => _changeFontSize(value),
              ),
            ),
            ListTile(
              title: Text('Language'),
              subtitle: DropdownButton<String>(
                value: language,
                items: ['English', 'Spanish', 'French']
                    .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ))
                    .toList(),
                onChanged: (value) => _changeLanguage(value!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum MyConstant{
  isLoggedIn,
}