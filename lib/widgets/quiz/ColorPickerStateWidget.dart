import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../theme.dart';
import 'Quiz.i18n.dart';

Widget getShowColorPickerStateWidget(
    Color selectedColor, Function onColorChanged, Function onSubmitPressed) {
  return Container(
    color: selectedColor,
    padding: EdgeInsets.only(bottom: QUIZ_BOTTOM_PADDING),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ColorPicker(
          enableAlpha: false,
          enableLabel: false,
          paletteType: PaletteType.hsv,
          pickerColor: selectedColor,
          onColorChanged: onColorChanged,
          pickerAreaHeightPercent: 1.0,
        ),
        DefaultButton(
          label: 'Select'.i18n,
          onPressed: onSubmitPressed,
          color: getHighContrastBW(selectedColor),
        ),
      ],
    ),
  );
}
