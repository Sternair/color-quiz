import 'package:color_quiz/utils/get_high_contrast_BW.dart';
import 'package:color_quiz/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';

Widget getShowTargetColorStateWidget(
    Color targetColor, Function onMakeGuessPressed) {
  return Container(
    color: targetColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Center(
          child: DefaultButton(
            label: 'Make a guess',
            onPressed: onMakeGuessPressed,
            color: getHighContrastBW(targetColor),
          ),
        ),
      ],
    ),
  );
}
