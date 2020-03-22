import 'dart:math';

import 'package:color_quiz/QColor.dart';
import 'package:flutter/material.dart';

const MAX_POINTS = 1000;
const MAX_ANGLE_DIFF = 40;

enum PointAlgorithm { SimpleRGB, HSV }

int calculatePoints(QColor target, Color selected,
    [PointAlgorithm pointAlgorithm = PointAlgorithm.HSV]) {
  if (pointAlgorithm == PointAlgorithm.HSV) {
    return getHSVPoints(
        HSVColor.fromColor(target.toColor()), HSVColor.fromColor(selected));
  } else {
    int points = 1000 -
        ((target.toColor().red - selected.red).abs() +
                (target.toColor().green - selected.green).abs() +
                (target.toColor().blue - selected.blue).abs()) *
            2;
    return points > 0 ? points : 0;
  }
}

int getHSVPoints(HSVColor c1, HSVColor c2) {
  return max(
      MAX_POINTS -
          _getHSVHueMinusPoints(getAngleDifference(c1.hue, c2.hue)).round(),
      0);
}

double _getHSVHueMinusPoints(double hueDiff) {
  if (hueDiff <= 20) {
    return hueDiff * 10;
  } else {
    return (hueDiff * MAX_ANGLE_DIFF) - (MAX_POINTS - (MAX_ANGLE_DIFF * 10));
  }
}

double getAngleDifference(double a1, double a2) {
  double simpleDiff = (a1 - a2).abs();
  return simpleDiff <= 180.0 ? simpleDiff : (simpleDiff - 360.0).abs();
}
