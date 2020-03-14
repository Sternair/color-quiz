import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:color_quiz/QColor.dart';

class ColorService {
  static ColorService _instance;
  final List<QColor> _colors;

  QColor _currentColor;

  ColorService(this._colors);

  static Future<ColorService> getInstance() async {
    if (_instance != null) {
      return _instance;
    }
    var stream = File('assets/colors/colors.csv').openRead();
    var list = await stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .skip(1)
        .map((line) {
      List row = line.split(';');
      return new QColor(
          name: row[0],
          r: int.parse(row[2]),
          g: int.parse(row[3]),
          b: int.parse(row[4]));
    }).toList();

    _instance = new ColorService(list);
    return _instance;
  }

  QColor getNewColor() {
    var i = new Random().nextInt(_colors.length);
    _currentColor = _colors[i];
    return getCurrentColor();
  }

  QColor getCurrentColor() {
    print('Returning current color ' + _currentColor.name);
    return _currentColor;
  }
}
