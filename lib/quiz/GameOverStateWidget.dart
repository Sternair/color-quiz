import 'package:color_quiz/utils/get_high_contrast_BW.dart';
import 'package:color_quiz/widgets/TextInput.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

Widget getGameOverStateWidget(BuildContext context, Color selectedColor,
    int totalPoints, Function onSavePressed) {
  String nameInput = DEFAULT_NAME;
  return Container(
    color: selectedColor,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Well done!\nYou got $totalPoints Points!',
            textAlign: TextAlign.center,
            style: TextStyle(color: getHighContrastBW(selectedColor)),
          ),
          TextInputForm(
            backgroundColor: getHighContrastBW(selectedColor),
            onTextChanged: (newText) => nameInput = newText,
          ),
          RaisedButton(
            child: Text(
              'Save',
            ),
            onPressed: () => onSavePressed(nameInput, context),
          ),
        ],
      ),
    ),
  );
}
