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
        RaisedButton(
          child: Text(
            'Submit',
          ),
          onPressed: onSubmitPressed,
        ),
      ],
    ),
  );
}
