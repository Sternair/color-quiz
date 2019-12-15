import 'package:flutter/material.dart';

Widget getShowTargetColorStateWidget(
    Color targetColor, Function onMakeGuessPressed) {
  return Container(
    color: targetColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Center(
          child: RaisedButton(
            child: Text(
              'Make a guess',
            ),
            onPressed: onMakeGuessPressed,
          ),
        ),
      ],
    ),
  );
}
