import 'package:color_quiz/ColorService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('should get new color and set as current', () async {
    final colorService = await ColorService.getInstance();

    final newColor = colorService.getNewColor();
    final currentColor = colorService.getCurrentColor();

    expect(newColor, currentColor);
  });
}
