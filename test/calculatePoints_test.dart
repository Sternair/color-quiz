import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/widgets/quiz/calculatePoints.dart';

void main() {
  test('calculatePoints', () {
    HSVColor c1 = HSVColor.fromAHSV(1.0, 0, 1.0, 1.0);
    expect(getHSVPoints(c1, c1), 1000);
    expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 10, 1.0, 1.0)), 900);
    expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 20, 1.0, 1.0)), 800);
    expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 40, 1.0, 1.0)), 0);
    expect(getHSVPoints(c1, HSVColor.fromAHSV(1.0, 41, 1.0, 1.0)), 0);
  });

  test('angle difference', () {
    expect(getAngleDifference(0.0, 0.0), 0.0);
    expect(getAngleDifference(1.0, 0.0), 1.0);
    expect(getAngleDifference(0.0, 1.0), 1.0);
    expect(getAngleDifference(0.0, 180.0), 180.0);
    expect(getAngleDifference(0.0, 181.0), 179.0);
  });
}
