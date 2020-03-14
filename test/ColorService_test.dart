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

  test('should filter out black, white and grey', () async {
    final colorService = await ColorService.getInstance();

    final colors = colorService.getColors();

    expect(colors.any((color) => color.name == 'Black'), false);
    expect(colors.any((color) => color.name == 'White'), false);
    expect(colors.any((color) => color.name == 'Old silver'), false);
    expect(colors.any((color) => color.name == 'Cool grey'), false);
  });
}
