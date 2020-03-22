import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/widgets/quiz/calculatePoints.dart';

void main() {
  group('calculatePoints', () {
    test('hue', () {
      HSVColor c1 = HSVColor.fromAHSV(1.0, 0, 1.0, 1.0);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 10, 1.0, 1.0)), 900);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 20, 1.0, 1.0)), 800);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 40, 1.0, 1.0)), 0);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 41, 1.0, 1.0)), 0);
    });

    test('saturation', () {
      HSVColor c1 = HSVColor.fromAHSV(1.0, 0, 1.0, 1.0);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 0, 0, 1.0)), 900);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 0, 0.5, 1.0)), 950);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 0, 0.99, 1.0)), 999);
    });

    test('value', () {
      HSVColor c1 = HSVColor.fromAHSV(1.0, 0, 1.0, 1.0);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 0, 1.0, 0)), 900);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 0, 1.0, 0.5)), 950);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 0, 1.0, 0.99)), 999);
    });

    test('combined', () {
      HSVColor c1 = HSVColor.fromAHSV(1.0, 0, 1.0, 1.0);
      expect(getHSVPoints(c1, c1), 1000);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 10, 0, 0)), 700);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 10, 0.9, 0.1)), 800);
      expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 5, 0.9, 0.1)), 850);
    });
  });

  test('angle difference', () {
    expect(getAngleDifference(0.0, 0.0), 0.0);
    expect(getAngleDifference(1.0, 0.0), 1.0);
    expect(getAngleDifference(0.0, 1.0), 1.0);
    expect(getAngleDifference(0.0, 180.0), 180.0);
    expect(getAngleDifference(0.0, 181.0), 179.0);
  });
}
