import 'package:color_quiz/QColor.dart';
import 'package:flutter/material.dart';

int calculatePoints(QColor targetColor, Color selectedColor) {
  int points = 500 -
      ((targetColor.r - selectedColor.red).abs() +
              (targetColor.g - selectedColor.green).abs() +
              (targetColor.b - selectedColor.blue).abs()) *
          2;
  return points > 0 ? points : 0;
}
