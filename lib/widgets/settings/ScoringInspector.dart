import 'package:color_quiz/QColor.dart';
import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:color_quiz/widgets/quiz/calculatePoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../quiz/calculatePoints.dart';

class ScoringInspector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScoringInspectorState();
}

class ScoringInspectorState extends State<ScoringInspector> {
  SelectedColor _selectedColor = SelectedColor.color1;
  Color _color1 = Color.fromRGBO(50, 100, 50, 1);
  Color _color2 = Color.fromRGBO(50, 100, 50, 1);

  void onColorChanged(Color color) {
    setState(() {
      _selectedColor == SelectedColor.color1
          ? _color1 = color
          : _color2 = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this._getSelectedColor(),
      appBar: AppBar(
        title: Text('Scoring Inspector'),
      ),
      body: Column(
        children: <Widget>[
          ColorPicker(
            enableAlpha: false,
            enableLabel: false,
            paletteType: PaletteType.hsv,
            pickerColor: this._getSelectedColor(),
            onColorChanged: onColorChanged,
            pickerAreaHeightPercent: 0.8,
          ),
          Text(
            'Points: ${calculatePoints(QColor(name: 'custom', hex: '#${_color1.value.toRadixString(16).substring(2)}'), _color2, PointAlgorithm.HSV)}',
            style:
                TextStyle(color: getHighContrastBW(this._getSelectedColor())),
            textAlign: TextAlign.right,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: _color1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: _selectedColor == SelectedColor.color2
                          ? <Widget>[
                              DefaultButton(
                                label: 'Select',
                                color: getHighContrastBW(_color1),
                                onPressed: () {
                                  setState(() {
                                    _selectedColor = SelectedColor.color1;
                                  });
                                },
                              )
                            ]
                          : [],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: _color2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: _selectedColor == SelectedColor.color1
                          ? <Widget>[
                              DefaultButton(
                                label: 'Select',
                                color: getHighContrastBW(_color2),
                                onPressed: () {
                                  setState(() {
                                    _selectedColor = SelectedColor.color2;
                                  });
                                },
                              )
                            ]
                          : [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getSelectedColor() {
    return _selectedColor == SelectedColor.color1 ? _color1 : _color2;
  }
}

enum SelectedColor { color1, color2 }
