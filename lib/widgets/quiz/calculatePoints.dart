import 'package:color_quiz/QColor.dart';
import 'package:flutter/material.dart';

int calculatePoints(QColor targetColor, Color selectedColor) {
  int points = 500 -
      ((targetColor.toColor().red - selectedColor.red).abs() +
              (targetColor.toColor().green - selectedColor.green).abs() +
              (targetColor.toColor().blue - selectedColor.blue).abs()) *
          2;
  return points > 0 ? points : 0;
}
