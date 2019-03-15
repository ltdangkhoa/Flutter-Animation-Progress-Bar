## Flutter Animation Progress Bar

This colorful [Flutter](https://flutter.io) widget package aims to show an animation progress bar in reactive style. It also supports both vertical and horizontal bar.

![](flutter_animation_progress_bar.gif)


### Getting Started

In order to use this package, do import
```dart
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
```

Basic example implementation can be done like below code:
```dart
FAProgressBar(
  currentValue: 20,
  displayText: '%',
)
```

### More examples

You can also customize progress bar for your own purpose:
```dart

```

### API
In this table, you can find all attributes provided by this package:

|Attribute|Default value|Description|
|-|-|-|
|currentValue|0|Set the current value for progress bar. This value should be in **stateful** so that |

### Objects
```dart
class FAProgressBar {

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
}
 ```


## Feedback

Please feel free to [give me any feedback](https://github.com/ltdangkhoa)
helping support this package 🍻 
