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
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                child: FAProgressBar(
                    size: 15,
                    backgroundColor: Colors.white,
                    progressColor: Colors.blueGrey,
                    currentValue: _currentValue,
                    animatedDuration: const Duration(milliseconds: 300),
                    direction: Axis.horizontal,
                    verticalDirection: VerticalDirection.up),
              )),
          Container(
              height: 450,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  children: <Widget>[
                    FAProgressBar(
                        size: 40,
                        borderRadius: new BorderRadius.circular(10),
                        backgroundColor: Colors.white,
                        progressColor: const Color(0xffFA7268),
                        currentValue: _currentValue,
                        animatedDuration: const Duration(milliseconds: 300),
                        direction: Axis.vertical,
                        verticalDirection: VerticalDirection.up),
                    Spacer(),
                    FAProgressBar(
                        size: 40,
                        progressColor: const Color(0xff5F4B8B),
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
                buildFloatingButton("1", () => setEndPressed(1)),
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
