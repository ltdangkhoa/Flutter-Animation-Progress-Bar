## Flutter Animation Progress Bar

This colorful [Flutter](https://flutter.io) widget package aims to show an animation progress bar in reactive style. It also supports both vertical and horizontal bar.

![](flutter_animation_progress_bar.gif)


### Flutter Create Contest
This package is also a submission to Flutter Create contest. The basic rule of this contest is to measure the total Dart file size less or equal 5KB.

After unzipping the compressed file, run following command to update dependencies:
```
flutter packages get
```

To evaluate the total size of all Dart files:
```
find . -name "*.dart" ! -name "*test*"  | xargs cat | wc -c
```

To evaluate only the package Dart code:
```
find . -name "*.dart" ! -name "*test*" ! -path "*example*"  | xargs cat | wc -c
```

To run simple example app with a total size of dart code less or equal 5KB:
```
cd example
flutter clean
flutter run
```
Hot restart app with "R" to replay the animation

To run the full example app:
```
cd example
mv lib/main.dart tmp && mv lib/main.dart.bk lib/main.dart && mv tmp lib/main.dart.bk
flutter clean
flutter run
```
Using built-in float action buttons to change value and see the effect

### Getting Started

In order to use this package, do import
```dart
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
```

Basic implementation can be done like below code:
```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

void main() {
  runApp(
    Center(
        child: FAProgressBar(
      currentValue: 80,
      displayText: '%',
    )),
  );
}
```

### Example App
You can find more examples from [Example App](example)


### API
In this table, you can find all attributes provided by this package:

| Attribute           | Default value                     | Description |
| ------------------- | --------------------------------- | ----------- |
| currentValue        | 0                                 | Set the current value for progress bar. This value should be in **stateful** so that whenever **setState()** has been called, the progress bar will trigger an animation from **latest currentValue** to **new currentValue** |
| maxValue            | 100                               | Max value to be displayed as progress bar. <br>*Current value can be greater than max value*  |
| size                | 30                                | The bar height if direction in Axis.horizontal. <br>The bar width if direction in Axis.vertical |
| animatedDuration    | const Duration(milliseconds: 300) | Set the duration for an animation cycle |
| direction           | Axis.horizontal                   | The bar can be in **Axis.horizontal** or **Axis.vertical** direction |
| verticalDirection   | VerticalDirection.down            | With vertical direction, the bar can be **VerticalDirection.up** or **VerticalDirection.down** direction|
| borderRadius        | 8                                 | Set the bar border radius |
| border              | ```null```                        | Set the bar border style by **BoxBorder** |
| backgroundColor     | const Color(0x00FFFFFF)           | Set the bar background color |
| progressColor       | const Color(0xFFFA7268)           | Set the bar progressing color |
| changeColorValue    | ```null```                        | Set a value that progress color should be changed to <br> [0---blue----[**70**]-red-100] |
| changeProgressColor | const Color(0xFF5F4B8B)           | Color that progressing color will be changed to, whenever **currentValue** greater than **changeColorValue** |
| displayText         | ```null```                        | Text to display belonging with currentValue. <br>Examples:<br> ```%``` -> ```20%```<br> ```°F``` -> ```80°F```|
| displayTextStyle    | ...                               | TextStyle of displayText|

### Objects
```dart
class FAProgressBar {

  final double currentValue;
  final double maxValue;
  final double size;
  final Duration animatedDuration;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final double borderRadius;
  final BoxBorder border;
  final Color backgroundColor;
  final Color progressColor;
  final int changeColorValue;
  final Color changeProgressColor;
  final String displayText;
  final TextStyle displayTextStyle;
}
 ```


### Feedback

Feel free to [leave any feedback](https://github.com/ltdangkhoa/Flutter-Animation-Progress-Bar/issues) for helping support this package 🍻 

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Me A Coffee")](https://www.buymeacoffee.com/13f742 "Buy Me A Coffee")
