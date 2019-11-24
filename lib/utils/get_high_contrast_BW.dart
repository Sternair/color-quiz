import 'package:flutter/material.dart';

Color getHighContrastBW(Color color) {
  return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
