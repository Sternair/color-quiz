import 'package:color_quiz/ColorService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return color', () async {
    final colorService = await ColorService.getInstance();

    final newColor = colorService.getNewColor();
    final currentColor = colorService.getCurrentColor();

    expect(newColor, currentColor);
  });
}
