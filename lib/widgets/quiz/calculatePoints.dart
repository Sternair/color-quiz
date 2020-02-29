import 'package:flutter/material.dart';

int calculatePoints(Color targetColor, Color selectedColor) {
  int points = 500 -
      ((targetColor.red - selectedColor.red).abs() +
              (targetColor.green - selectedColor.green).abs() +
              (targetColor.blue - selectedColor.blue).abs()) *
          2;
  return points > 0 ? points : 0;
}
