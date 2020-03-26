import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:flutter/material.dart';

import '../../QColor.dart';
import '../../theme.dart';
import '../../utils/getHighContrastBW.dart';

Widget getShowSoultionStateWidget(Color selectedColor, QColor targetColor,
    int pointsWon, Function onContinuePressed) {
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
                    children: [
                      TableRow(
                        children: [
                          _getTableText(
                              'Guess', getHighContrastBW(selectedColor)),
                          Container(),
                          _getTableText(
                              'Target', getHighContrastBW(selectedColor)),
                        ],
                      ),
                      TableRow(
                        children: [
                          _getTableText('${selectedColor.red}',
                              getHighContrastBW(selectedColor)),
                          _getTableText(
                              'red', getHighContrastBW(selectedColor)),
                          _getTableText('${targetColor.toColor().red}',
                              getHighContrastBW(selectedColor)),
                        ],
                      ),
                      TableRow(
                        children: [
                          _getTableText('${selectedColor.green}',
                              getHighContrastBW(selectedColor)),
                          _getTableText(
                              'green', getHighContrastBW(selectedColor)),
                          _getTableText('${targetColor.toColor().green}',
                              getHighContrastBW(selectedColor)),
                        ],
                      ),
                      TableRow(
                        children: [
                          _getTableText('${selectedColor.blue}',
                              getHighContrastBW(selectedColor)),
                          _getTableText(
                              'blue', getHighContrastBW(selectedColor)),
                          _getTableText('${targetColor.toColor().blue}',
                              getHighContrastBW(selectedColor)),
                        ],
                      )
                    ],
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

Text _getTableText(String label, Color color) {
  return Text(
    label,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 15,
    ),
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
