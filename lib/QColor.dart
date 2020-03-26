import 'package:flutter/cupertino.dart';

class QColor {
  final String name;
  final String hex;
  Color _color;
  double hue;
  double saturation;
  double value;

  /// hex value with '#'
  QColor({@required this.name, @required this.hex}) {
    this._color = Color.fromRGBO(hexToInt(hex.substring(1, 3)),
        hexToInt(hex.substring(3, 5)), hexToInt(hex.substring(5, 7)), 1);
    this.hue = HSVColor.fromColor(_color).hue;
    this.saturation = HSVColor.fromColor(_color).saturation;
    this.value = HSVColor.fromColor(_color).value;
  }

  Color toColor() {
    return _color;
  }
}

int hexToInt(String hex) {
  return int.parse(hex, radix: 16);
}
