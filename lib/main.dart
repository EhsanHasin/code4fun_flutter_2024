import 'package:flutter/material.dart';
void main(){
  var title = "Calculator";
  var temp = '';
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 30),),
          TextField(
            onChanged: (data){
              temp = data;
            },
          ),
          ElevatedButton(onPressed: (){
            print(temp);
          }, child: Text("Result"))
        ],
      ),
    )),
  );
}

class MyNewText extends StatelessWidget {
  const MyNewText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Data", style: TextStyle(color: Colors.green),);
  }
}

class MyNewButton extends StatefulWidget {
  const MyNewButton({super.key});

  @override
  State<MyNewButton> createState() => _MyNewButtonState();
}
class _MyNewButtonState extends State<MyNewButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: null, child: Text("temp"));
  }
}
