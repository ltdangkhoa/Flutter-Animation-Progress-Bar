import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FAProgressBar extends StatefulWidget {
  FAProgressBar(
      {Key key,
      this.currentValue = 0,
      this.maxValue = 100,
      this.size = 30,
      this.animatedDuration = const Duration(milliseconds: 300),
      this.direction = Axis.horizontal,
      this.verticalDirection = VerticalDirection.down,
      this.borderRadius = 8,
      this.backgroundColor = Colors.transparent,
      this.progressColor = const Color(0xffFA7268),
      this.changeColorValue,
      this.changeProgressColor = Colors.blue,
      this.displayText})
      : super(key: key);

  final int currentValue;
  final int maxValue;
  final double size;
  final Duration animatedDuration;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final double borderRadius;
  final Color backgroundColor;
  final Color progressColor;
  final int changeColorValue;
  final Color changeProgressColor;
  final String displayText;

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
    _controller =
        AnimationController(duration: widget.animatedDuration, vsync: this);
    _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
        .animate(_controller);
    super.initState();
  }

  @override
  void didUpdateWidget(FAProgressBar oldWidget) {
    setState(() {
      _currentBegin = _animation.value;
      _currentEnd = widget.currentValue / widget.maxValue;
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
        widget: widget,
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  AnimatedProgressBar({
    Key key,
    Animation<double> animation,
    this.widget,
  }) : super(key: key, listenable: animation);
  final widget;

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    final _colorTween = ColorTween(
        begin: widget.progressColor, end: widget.changeProgressColor);

    double transformValue = 0;
    if (widget.changeColorValue != null) {
      if (((widget.changeColorValue - 5) / widget.maxValue) > animation.value) {
        transformValue = 0;
      } else if (((widget.changeColorValue) / widget.maxValue) <=
          animation.value) {
        transformValue = 1;
      } else {
        transformValue = (widget.maxValue * animation.value -
                (widget.changeColorValue - 5)) *
            0.2;
      }
    }

    List<Widget> progressWidgets = [];
    Widget progressWidget = new Opacity(
        opacity: 1,
        child: Container(
            decoration: BoxDecoration(
          color: widget.changeColorValue != null
              ? _colorTween.transform(transformValue)
              : widget.progressColor,
          borderRadius: new BorderRadius.circular(widget.borderRadius),
        )));
    progressWidgets.add(progressWidget);

    if (widget.displayText != null) {
      Widget textWidget = new Align(
          alignment: widget.direction == Axis.horizontal
              ? FractionalOffset(0.95, 0.5)
              : (widget.verticalDirection == VerticalDirection.up
                  ? FractionalOffset(0.5, 0.05)
                  : FractionalOffset(0.5, 0.95)),
          child: Text(
            (animation.value * widget.maxValue).toInt().toString() +
                widget.displayText,
            softWrap: false,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ));
      progressWidgets.add(textWidget);
    }

    return Container(
        alignment: Alignment.bottomCenter,
        width: widget.direction == Axis.vertical ? widget.size : null,
        height: widget.direction == Axis.horizontal ? widget.size : null,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: new BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: widget.progressColor,
            width: 0.2,
          ),
        ),
        child: Flex(
          direction: widget.direction,
          verticalDirection: widget.verticalDirection,
          children: <Widget>[
            Expanded(
              flex: (animation.value * 100).toInt(),
              child: Stack(
                children: progressWidgets,
              ),
            ),
            Expanded(
                flex: 100 - (animation.value * 100).toInt(), child: Container())
          ],
        ));
  }
}
