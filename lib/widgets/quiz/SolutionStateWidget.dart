import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:flutter/material.dart';

import '../../QColor.dart';
import '../../theme.dart';
import '../../utils/getHighContrastBW.dart';

Widget getShowSoultionStateWidget(Color selectedColor, QColor targetColor,
    int pointsWon, Function onContinuePressed, bool showHSVDetails) {
  Text _getTableText(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: getHighContrastBW(selectedColor),
        fontSize: 15,
      ),
    );
  }

  return Stack(
    children: [
      Container(
        color: selectedColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: targetColor.toColor(),
                child: Center(
                  child: Text(
                    'Target Color Name:\n${targetColor.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: getHighContrastBW(targetColor.toColor())),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: selectedColor,
                child: Center(
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(50),
                    children: showHSVDetails
                        ? [
                            TableRow(
                              children: [
                                _getTableText('Guess'),
                                Container(),
                                _getTableText('Target'),
                              ],
                            ),
                            TableRow(
                              children: [
                                _getTableText(
                                    '${HSVColor.fromColor(selectedColor).hue.round()}'),
                                _getTableText('hue'),
                                _getTableText('${targetColor.hue.round()}'),
                              ],
                            ),
                            TableRow(
                              children: [
                                _getTableText(
                                    '${HSVColor.fromColor(selectedColor).saturation.toStringAsFixed(2)}'),
                                _getTableText('sat'),
                                _getTableText(
                                    '${targetColor.saturation.toStringAsFixed(2)}'),
                              ],
                            ),
                            TableRow(
                              children: [
                                _getTableText(
                                    '${HSVColor.fromColor(selectedColor).value.toStringAsFixed(2)}'),
                                _getTableText('value'),
                                _getTableText(
                                    '${targetColor.value.toStringAsFixed(2)}'),
                              ],
                            )
                          ]
                        : [],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Center(child: _getPoints(pointsWon)),
              ),
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(bottom: QUIZ_BOTTOM_PADDING),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            DefaultButton(
              label: 'Continue',
              onPressed: onContinuePressed,
              color: getHighContrastBW(selectedColor),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _getPoints(int points) {
  String label = '+ $points';
  return Stack(
    children: <Widget>[
      // Stroked text as border.
      Text(
        label,
        style: TextStyle(
          fontSize: 40,
          letterSpacing: 5,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..color = COLOR_BLACK,
        ),
      ),
      // Solid text as fill.
      Text(
        label,
        style: TextStyle(
          fontSize: 40,
          color: COLOR_GOLD,
          letterSpacing: 5,
        ),
      ),
    ],
  );
}
