import 'package:flutter/material.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

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
  double _currentValue = 0;

  setEndPressed(double value) {
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
              height: 100,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(children: [
                    FAProgressBar(
                      currentValue: _currentValue,
                      displayText: '%',
                    ),
                    Spacer(),
                    FAProgressBar(
                      currentValue: _currentValue,
                      size: 25,
                      maxValue: 150,
                      changeColorValue: 100,
                      changeProgressColor: Colors.pink,
                      backgroundColor: Colors.white,
                      progressColor: Colors.lightBlue,
                      animatedDuration: const Duration(milliseconds: 300),
                      direction: Axis.horizontal,
                      verticalDirection: VerticalDirection.up,
                      displayText: 'mph',
                    )
                  ]))),
          Container(
              height: 450,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  children: <Widget>[
                    FAProgressBar(
                      currentValue: _currentValue,
                      maxValue: 140,
                      size: 40,
                      animatedDuration: const Duration(milliseconds: 400),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 0.5,
                      ),
                      backgroundColor: Colors.white,
                      progressColor: Colors.green,
                      changeColorValue: 90,
                      changeProgressColor: Colors.red,
                      displayText: '°C',
                    ),
                    Spacer(),
                    FAProgressBar(
                        maxValue: 140,
                        size: 40,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        progressColor: const Color(0xff5F4B8B),
                        currentValue: _currentValue,
                        direction: Axis.vertical,
                        verticalDirection: VerticalDirection.down),
                    Spacer(),
                    FAProgressBar(
                        size: 40,
                        progressColor: Colors.black54,
                        backgroundColor: Colors.white,
                        currentValue: _currentValue,
                        animatedDuration: const Duration(milliseconds: 800),
                        direction: Axis.vertical,
                        verticalDirection: VerticalDirection.up)
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
                buildFloatingButton("70", () => setEndPressed(70)),
                buildFloatingButton("80.5", () => setEndPressed(80.5)),
                buildFloatingButton("90.25", () => setEndPressed(90.25)),
                buildFloatingButton("100", () => setEndPressed(100)),
                buildFloatingButton("140", () => setEndPressed(140)),
              ],
            )),
          )),
        ],
      )),
    );
  }
}
