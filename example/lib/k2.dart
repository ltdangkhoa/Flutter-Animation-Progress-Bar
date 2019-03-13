import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class MyK2 extends StatefulWidget {
  MyK2({Key key, this.currentValue, this.direction, this.verticalDirection})
      : super(key: key);

  final int currentValue;
  final Axis direction;
  final VerticalDirection verticalDirection;

  @override
  _MyK2State createState() => _MyK2State();
}

class _MyK2State extends State<MyK2> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double currentBegin = 0;
  double currentEnd = 0;

  @override
  void initState() {

    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation =
        Tween<double>(begin: currentBegin, end: currentEnd).animate(controller);
//    animation.addStatusListener((status) {
//      print('$status');
//    });
//    animation.addListener(() {
//      print('anmation listener'+animation.value.toString());
//      setState(() {});
//    });
//    controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(MyK2 oldWidget) {
    print(animation.value);
    setState(() {
      currentBegin = animation.value;
      currentEnd = widget.currentValue/100;
      animation =
          Tween<double>(begin: currentBegin, end: currentEnd).animate(controller);
    });
    print(currentBegin);
    print(currentEnd);
    controller.reset();
    controller.forward();
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) => AnimatedLogo(
      animation: animation,
      value: widget.currentValue,
      direction: widget.direction,
      verticalDirection: widget.verticalDirection);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(
      {Key key,
      Animation<double> animation,
      this.value,
      this.direction,
      this.verticalDirection})
      : super(key: key, listenable: animation);
  final int value;
  final Axis direction;
  final VerticalDirection verticalDirection;

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
        alignment: Alignment.bottomCenter,
        color: Colors.blue,
        width: this.direction == Axis.vertical ? 30 : null,
        height: this.direction == Axis.horizontal ? 30 : null,
        child: Flex(
          direction: this.direction,
          verticalDirection: this.verticalDirection,
          children: <Widget>[
            Flexible(
              flex: (animation.value * 100).toInt(),
//              flex: currentValue,
              child: Container(
                color: Colors.lightGreen,
              ),
            ),
            Spacer(flex: 100 - (animation.value * 100).toInt()),
//            Spacer(flex: 100 - currentValue),
          ],
        ));
  }
}
