import 'package:flutter/cupertino.dart';

class QColor {
  final String name;
  final String hex;
  Color _color;

  /// hex value with '#'
  QColor({@required this.name, @required this.hex}) {
    this._color = Color.fromRGBO(hexToInt(hex.substring(1, 3)),
        hexToInt(hex.substring(3, 5)), hexToInt(hex.substring(5, 7)), 1);
  }

  Color toColor() {
    return _color;
  }
}

int hexToInt(String hex) {
  return int.parse(hex, radix: 16);
}
