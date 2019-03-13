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
          child: Column(
        children: <Widget>[
          Container(
            child: FAProgressBar(
                size: 40,
                backgroundColor: Colors.white,
                progressColor: Colors.blueGrey,
                currentValue: _currentValue,
                animatedDuration: const Duration(milliseconds: 300),
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.up),
          ),
          Container(
              height: 250,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  children: <Widget>[
                    FAProgressBar(
                        size: 30,
                        backgroundColor: Colors.green,
                        progressColor: Colors.yellowAccent,
                        currentValue: _currentValue,
                        animatedDuration: const Duration(milliseconds: 300),
                        direction: Axis.vertical,
                        verticalDirection: VerticalDirection.up),
                    FAProgressBar(
                        size: 50,
                        backgroundColor: Colors.brown,
                        progressColor: Colors.blue,
                        currentValue: _currentValue,
                        animatedDuration: const Duration(milliseconds: 800),
                        direction: Axis.vertical,
                        verticalDirection: VerticalDirection.down)
                  ],
                ),
              )),
          Container(
              child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Container(
                child: Row(
              children: <Widget>[
                buildFloatingButton("0", () => setEndPressed(0)),
                buildFloatingButton("5", () => setEndPressed(5)),
                buildFloatingButton("40", () => setEndPressed(40)),
                buildFloatingButton("60", () => setEndPressed(60)),
                buildFloatingButton("70", () => setEndPressed(70)),
                buildFloatingButton("100", () => setEndPressed(100)),
              ],
            )),
          )),
        ],
      )),
    );
  }
}
