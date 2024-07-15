import 'package:flutter/material.dart';

void main() {
  Text txt1 = Text(
    "Welcome to the very basic App",
    textDirection: TextDirection.ltr,
    style: TextStyle(fontSize: 20.0, color: Colors.white,fontWeight: FontWeight.bold),
  );
  Text txt2 = Text('This is just a text',style: TextStyle(color: Colors.yellow,fontSize: 25,fontWeight: FontWeight.bold),);
  Center c = Center(
    child: txt1,
  );
  Center cc = Center(
    child: txt2,
  );
  SizedBox sizedBox = SizedBox(height: 30,);
  ElevatedButton goButton =
      ElevatedButton(onPressed: () {print('Go Button is Pressed');}, child: Text('Lets go'),style: ElevatedButton.styleFrom(shadowColor: Colors.yellow,foregroundColor: Colors.green,elevation: 20),);
  ElevatedButton cancelButton =
      ElevatedButton(onPressed: () {print('Cancel Button is Pressed');}, child: Text('cancel'),style: ElevatedButton.styleFrom(shadowColor: Colors.green,foregroundColor: Colors.red,elevation: 20),);
  Row myRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [cancelButton,goButton],
  );
  Expanded expandedRow = Expanded(child: myRow,);
  Expanded expandedText = Expanded(child: txt1);
  Column culumn = Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [c,sizedBox,cc,sizedBox, myRow],
  );
  Scaffold scf = Scaffold(body: culumn,backgroundColor: Colors.blueGrey,);
  MaterialApp mt = MaterialApp(home: scf,);
  runApp(mt);
}
