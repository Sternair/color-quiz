import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:color_quiz/QColor.dart';
import 'package:flutter/services.dart' show rootBundle;

class ColorService {
  static ColorService _instance;
  final List<QColor> _colors;

  QColor _currentColor;

  ColorService(this._colors);

  static Future<ColorService> getInstance() async {
    if (_instance != null) {
      return _instance;
    }
    developer.log('ColorService init ...');
    var list = await rootBundle
        .loadString('assets/colors/colors.csv')
        .asStream()
        .transform(const LineSplitter())
        .skip(1)
        .map((rawRow) {
      List row = rawRow.split(';');
      return new QColor(name: row[0], hex: row[1]);
    }).where((QColor color) {
      var r = color.toColor().red;
      return color.toColor().computeLuminance() > 0.1 &&
          color.toColor().computeLuminance() < 0.9 &&
          ((color.toColor().green - r).abs() > 35 ||
              (color.toColor().blue - r).abs() > 35);
    }).toList();

    _instance = new ColorService(list);
    developer.log('ColorService initiated');
    return _instance;
  }

  QColor getNewColor() {
    var i = new Random().nextInt(_colors.length);
    _currentColor = _colors[i];
    return getCurrentColor();
  }

  QColor getCurrentColor() {
    developer.log('Returning current color ' + _currentColor.name);
    return _currentColor;
  }

  List<QColor> getColors() {
    developer.log('Returning all ${_colors.length} colors');
    return _colors;
  }
}
