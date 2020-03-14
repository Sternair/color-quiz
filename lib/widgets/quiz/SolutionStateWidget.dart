import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:flutter/material.dart';

import '../../QColor.dart';

Widget getShowSoultionStateWidget(Color selectedColor, QColor targetColor,
    int pointsWon, Function onContinuePressed) {
  return Container(
    color: selectedColor,
    child: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: targetColor.toColor(),
            child: Center(
              child: Text(
                'Target Color\n\n${targetColor.name}\n(R: ${targetColor.r}, G: ${targetColor.g}, B: ${targetColor.b})',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: getHighContrastBW(targetColor.toColor())),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: selectedColor,
            child: Center(
              child: Text(
                'You won $pointsWon Points\nYour Guess\nR: ${selectedColor.red}, G: ${selectedColor.green}, B: ${selectedColor.blue}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getHighContrastBW(selectedColor),
                ),
              ),
            ),
          ),
        ),
        DefaultButton(
          label: 'Continue',
          onPressed: onContinuePressed,
          color: getHighContrastBW(selectedColor),
        ),
      ],
    ),
  );
}
