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
