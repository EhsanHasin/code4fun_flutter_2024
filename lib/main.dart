import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PracticePage(),
    );
  }
}

class PracticePage extends StatefulWidget {
  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  // Controllers for the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Variables to hold validated data
  String _displayName = '';
  int? _displayAge;
  String? _nameError;
  String? _ageError;

  // Method to manually validate and submit the form
  void _submitForm() {
    // Reset errors
    setState(() {
      _nameError = null;
      _ageError = null;
    });

    bool isValid = true;

    // Validate name
    if (_nameController.text.isEmpty) {
      setState(() {
        _nameError = 'Name cannot be empty';
      });
      isValid = false;
    }

    // Validate age
    int? age = int.tryParse(_ageController.text);
    if (_ageController.text.isEmpty) {
      setState(() {
        _ageError = 'Age cannot be empty';
      });
      isValid = false;
    } else if (age == null || age < 18) {
      setState(() {
        _ageError = 'Age must be 18 or above';
      });
      isValid = false;
    }

    if (isValid) {
      setState(() {
        _displayName = _nameController.text;
        _displayAge = age;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displaying an image from assets
            Image.asset('assets/images/wassa-logo.gif', width: 200, height: 200),
            SizedBox(height: 20),
            // Text field for name input with manual validation
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                errorText: _nameError,
              ),
            ),
            SizedBox(height: 20),
            // Text field for age input with manual validation
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your age',
                errorText: _ageError,
              ),
            ),
            SizedBox(height: 20),
            // Button to submit the form
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            // Display the validated data
            if (_displayName.isNotEmpty && _displayAge != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $_displayName'),
                  Text('Age: $_displayAge'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
