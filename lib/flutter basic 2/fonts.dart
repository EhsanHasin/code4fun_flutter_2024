import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Simple Text", style: TextStyle(fontSize: 35),),
            Text("Another Text", style: TextStyle(fontSize: 35, fontFamily: 'robo'),),
            Text("Another Text", style: TextStyle(fontSize: 35, fontFamily: 'Robo', fontStyle: FontStyle.italic),),
            Text("Another Text", style: TextStyle(fontSize: 35, fontFamily: 'lato',),),
            Text("Another Text", style: TextStyle(fontSize: 35, fontFamily: 'baby',),),
            Text(
              'This is Google Fonts',
              style: GoogleFonts.roboto(),
            ),

            Text(
              'This is Google Fonts',
              style: GoogleFonts.lobster(),
            ),
          ],
        ),
      ),
    );
  }
}
