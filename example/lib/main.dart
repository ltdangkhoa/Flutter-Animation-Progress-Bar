import 'package:flutter/material.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'k1.dart';
import 'k2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestApp(),
    );
  }
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  int _currentValue = 20;

  setEndPressed(int value) {
    setState(() {
      _currentValue = value;
    });
  }

  Widget buildFloatingButton(String text, VoidCallback callback) {
    TextStyle roundTextStyle =
        const TextStyle(fontSize: 16.0, color: Colors.white);
    return new FloatingActionButton(
        child: new Text(text, style: roundTextStyle), onPressed: callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Row(
          children: <Widget>[
            MyK2(value: _currentValue, direction: Axis.vertical, verticalDirection: VerticalDirection.down),
            Container(
                child: Column(
              children: <Widget>[
                buildFloatingButton("10", () => setEndPressed(10)),
                buildFloatingButton("30", () => setEndPressed(30)),
                buildFloatingButton("50", () => setEndPressed(50)),
                buildFloatingButton("70", () => setEndPressed(70)),
                buildFloatingButton("90", () => setEndPressed(90)),
              ],
            )),
            JumpingDotsProgressIndicator(fontSize: 35, )
          ],
        ),
      ),
    );
  }
}
