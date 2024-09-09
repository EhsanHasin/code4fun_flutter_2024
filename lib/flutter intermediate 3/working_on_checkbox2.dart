import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _username = '';
  String _password = '';
  bool _rememberMe = false;

  // Checkbox states for skills/languages
  Map<String, bool> _skills = {
    'Dart': false,
    'Flutter': false,
    'Python': false,
    'JavaScript': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text('Remember Me'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Select Your Skills/Languages:',
              style: TextStyle(fontSize: 16),
            ),
            Column(
              children: _skills.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: _skills[key],
                  onChanged: (bool? value) {
                    setState(() {
                      _skills[key] = value!;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle sign-in logic here
                  print('Username: $_username');
                  print('Password: $_password');
                  print('Remember Me: $_rememberMe');
                  print('Selected Skills/Languages:');
                  _skills.forEach((key, value) {
                    if (value) print(key);
                  });
                },
                child: Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
