import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
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
