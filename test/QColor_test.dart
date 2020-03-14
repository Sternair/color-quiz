import 'package:color_quiz/QColor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert hex color to Color object (with #)', () {
    var qColor = QColor(name: 'test color', hex: '#010FFF');

    var qColorColor = qColor.toColor();

    expect(qColorColor.red, 1);
    expect(qColorColor.green, 15);
    expect(qColorColor.blue, 255);
  });

  test('should convert hex to int', () {
    expect(hexToInt('0'), 0);
    expect(hexToInt('1'), 1);
    expect(hexToInt('A'), 10);
    expect(hexToInt('F'), 15);
    expect(hexToInt('0F'), 15);
    expect(hexToInt('FF'), 255);
  });
}
