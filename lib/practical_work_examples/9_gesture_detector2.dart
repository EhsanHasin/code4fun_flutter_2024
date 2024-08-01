import 'package:flutter/material.dart';

void main() {
  runApp(GestureDetectorExample());
}

class GestureDetectorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureDetector Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GestureDetectorPage(),
    );
  }
}

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  String _message = 'No gesture detected';

  void _updateMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _updateMessage('Tap detected');
              },
              onDoubleTap: () {
                _updateMessage('Double tap detected');
              },
              onLongPress: () {
                _updateMessage('Long press detected');
              },
              onPanUpdate: (details) {
                _updateMessage('Swipe detected');
              },
              child: Container(
                color: Colors.lightBlueAccent,
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    'Tap, Double Tap, Long Press, or Swipe',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(GestureDetectorExample());
// }
//
// class GestureDetectorExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Advanced GestureDetector Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GestureDetectorPage(),
//     );
//   }
// }
//
// class GestureDetectorPage extends StatefulWidget {
//   @override
//   _GestureDetectorPageState createState() => _GestureDetectorPageState();
// }
//
// class _GestureDetectorPageState extends State<GestureDetectorPage> {
//   double _scale = 1.0;
//   double _previousScale = 1.0;
//   Offset _position = Offset(100, 100);
//   Offset _offset = Offset.zero;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Advanced GestureDetector Example'),
//       ),
//       body: Stack(
//         children: [
//           Positioned(
//             left: _position.dx,
//             top: _position.dy,
//             child: GestureDetector(
//               onScaleStart: (details) {
//                 _previousScale = _scale;
//               },
//               onScaleUpdate: (details) {
//                 setState(() {
//                   _scale = _previousScale * details.scale;
//                   _offset = details.focalPoint - _position;
//                 });
//               },
//               onScaleEnd: (details) {
//                 _previousScale = 1.0;
//                 setState(() {
//                   _position += _offset;
//                   _offset = Offset.zero;
//                 });
//               },
//               child: Transform.scale(
//                 scale: _scale,
//                 child: Container(
//                   width: 150,
//                   height: 150,
//                   color: Colors.lightBlueAccent,
//                   child: Center(
//                     child: Text(
//                       'Pinch to Scale\nDrag to Move',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
