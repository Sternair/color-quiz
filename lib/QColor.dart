import 'package:flutter/cupertino.dart';

class QColor {
  final String name;
  final int r;
  final int g;
  final int b;

  QColor(
      {@required this.name,
      @required this.r,
      @required this.g,
      @required this.b});

  Color toColor() {
    return Color.fromRGBO(this.r, this.g, this.b, 1.0);
  }
}
