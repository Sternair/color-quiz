import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:color_quiz/widgets/common/TextInput.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

Widget getGameOverStateWidget(BuildContext context, Color selectedColor,
    int totalPoints, Function onSavePressed) {
  String nameInput = DEFAULT_NAME;
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    color: selectedColor,
    child: Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Well done!\nYou got $totalPoints Points!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: getHighContrastBW(selectedColor)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextInputForm(
                    backgroundColor: getHighContrastBW(selectedColor),
                    onTextChanged: (newText) => nameInput = newText,
                  ),
                ),
              ],
            ),
          ),
        ),
        DefaultButton(
          label: 'Save',
          onPressed: () => onSavePressed(nameInput, context),
          color: getHighContrastBW(selectedColor),
        ),
      ],
    ),
  );
}
