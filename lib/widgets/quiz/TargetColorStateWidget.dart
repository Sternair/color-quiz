import 'package:color_quiz/QColor.dart';
import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:flutter/material.dart';

Widget getShowTargetColorStateWidget(
    QColor targetColor, Function onMakeGuessPressed) {
  return Container(
    color: targetColor.toColor(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Center(
          child: DefaultButton(
            label: 'Make a guess',
            onPressed: onMakeGuessPressed,
            color: getHighContrastBW(targetColor.toColor()),
          ),
        ),
      ],
    ),
  );
}
