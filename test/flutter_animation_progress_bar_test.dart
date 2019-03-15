import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

void main() {
  test('initial with current value 50', () {
    final faProgressBar = FAProgressBar(
      currentValue: 50,
    );
    expect(faProgressBar.currentValue, 50);
  });
}
