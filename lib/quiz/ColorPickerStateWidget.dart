import 'package:color_quiz/utils/get_high_contrast_BW.dart';
import 'package:color_quiz/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Widget getShowColorPickerStateWidget(
    Color selectedColor, Function onColorChanged, Function onSubmitPressed) {
  return Container(
    color: selectedColor,
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
          label: 'Submit',
          onPressed: onSubmitPressed,
          color: getHighContrastBW(selectedColor),
        ),
      ],
    ),
  );
}
