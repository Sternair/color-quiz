import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:flutter/material.dart';

Widget getShowSoultionStateWidget(Color selectedColor, Color targetColor,
    int pointsWon, Function onContinuePressed) {
  return Container(
    color: selectedColor,
    child: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: targetColor,
            child: Center(
              child: Text(
                'Target Color\nR: ${targetColor.red}, G: ${targetColor.green}, B: ${targetColor.blue}',
                textAlign: TextAlign.center,
                style: TextStyle(color: getHighContrastBW(targetColor)),
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
