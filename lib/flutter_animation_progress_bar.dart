import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FAProgressBar extends StatefulWidget {
  FAProgressBar(
      {Key key,
      this.currentValue = 0,
      this.size = 30,
      this.backgroundColor = Colors.white,
      this.progressColor,
      this.animatedDuration = const Duration(milliseconds: 300),
      this.direction = Axis.horizontal,
//      this.horizontalDirection = AxisDirection.left,
      this.verticalDirection = VerticalDirection.down})
      : super(key: key);

  final int currentValue;
  final double size;
  final Color backgroundColor;
  final Color progressColor;
  final Duration animatedDuration;
  final Axis direction;
//  final AxisDirection horizontalDirection;
  final VerticalDirection verticalDirection;

  @override
  _FAProgressBarState createState() => _FAProgressBarState();
}

class _FAProgressBarState extends State<FAProgressBar>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  double _currentBegin = 0;
  double _currentEnd = 0;

  @override
  void initState() {
//    int animatedDuration = widget.animatedDuration;
    _controller =
        AnimationController(duration: widget.animatedDuration, vsync: this);
    _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
        .animate(_controller);
    super.initState();
  }

  ///Controller for class [FAProgressBar] go here with Reactive style
  ///When the new state of [FAProgressBar.currentValue] raised,
  ///update [_currentBegin] and [_currentEnd] and also reset [_animation] value.
  ///Trigger [_controller] reset then forward before rebuild the widget
  @override
  void didUpdateWidget(FAProgressBar oldWidget) {
    setState(() {
      _currentBegin = _animation.value;
      _currentEnd = widget.currentValue / 100;
      _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
          .animate(_controller);
    });
    _controller.reset();
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => AnimatedProgressBar(
      animation: _animation,
      backgroundColor: widget.backgroundColor,
      progressColor: widget.progressColor,
      size: widget.size,
      direction: widget.direction,
      verticalDirection: widget.verticalDirection);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  AnimatedProgressBar(
      {Key key,
      Animation<double> animation,
      this.size,
      this.backgroundColor,
      this.progressColor,
      this.direction,
      this.verticalDirection})
      : super(key: key, listenable: animation);
  final double size;
  final Color backgroundColor;
  final Color progressColor;
  final Axis direction;
  final VerticalDirection verticalDirection;

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
        alignment: Alignment.bottomCenter,
        width: this.direction == Axis.vertical ? this.size : null,
        height: this.direction == Axis.horizontal ? this.size : null,
        decoration: BoxDecoration(
          color: this.backgroundColor,
          border: Border.all(
            color: this.progressColor,
            width: 0.2,
          ),
          borderRadius: new BorderRadius.circular(this.size/2),
        ),
        child: Flex(
          direction: this.direction,
          verticalDirection: this.verticalDirection,
          children: <Widget>[
            Expanded(
              flex: (animation.value * 100).toInt(),
              child: Container(
                decoration: BoxDecoration(
                  color: this.progressColor,
                  borderRadius: new BorderRadius.circular(this.size/2),
                )
              ),
            ),
            Expanded(
              flex: 100 - (animation.value * 100).toInt(),
              child: Container(

              )
            )
          ],
        ));
  }
}
