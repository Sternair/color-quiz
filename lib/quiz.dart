import 'dart:math';

import 'package:color_quiz/utils/get_high_contrast_BW.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

enum Stage { SHOW_TARGET_COLOR, SHOW_COLOR_PICKER, SHOW_SOLUTION }

class QuizState extends State<Quiz> {
  Color _targetColor;
  Color _selectedColor = Color.fromRGBO(15, 15, 15, 1.0);

  int _points = 0;

  Stage _stage = Stage.SHOW_TARGET_COLOR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 15, 1.0),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              '$_points Points',
              style: TextStyle(color: Colors.white),
            ),
            if (_stage == Stage.SHOW_TARGET_COLOR)
              ..._getShowTargetColorStateWidgets()
            else if (_stage == Stage.SHOW_COLOR_PICKER)
              ..._getShowColorPickerStateWidgets()
            else if (_stage == Stage.SHOW_SOLUTION)
              ..._getShowSoultionStateWidgets()
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    _setNewColors();
  }

  List<Widget> _getShowTargetColorStateWidgets() {
    return [
      Expanded(
        child: new Container(
          color: _targetColor,
        ),
      ),
      Center(
        child: RaisedButton(
          child: Text(
            'Make a guess',
          ),
          onPressed: _onMakeGuessPressed,
        ),
      ),
    ];
  }

  List<Widget> _getShowColorPickerStateWidgets() {
    return [
      Expanded(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          color: _selectedColor,
          child: ColorPicker(
            enableAlpha: false,
            enableLabel: false,
            paletteType: PaletteType.hsv,
            pickerColor: _selectedColor,
            onColorChanged: (Color selectedColor) {
              setState(() {
                _selectedColor = selectedColor;
              });
            },
            pickerAreaHeightPercent: 0.8,
          ),
        ),
      ),
      RaisedButton(
        child: Text(
          'Submit',
        ),
        onPressed: _onSubmitPressed,
      ),
    ];
  }

  List<Widget> _getShowSoultionStateWidgets() {
    return [
      Expanded(
        child: Container(
          color: _targetColor,
          child: Center(
            child: Text(
              'Target Color\nR: ${_targetColor.red}, G: ${_targetColor.green}, B: ${_targetColor.blue}',
              textAlign: TextAlign.center,
              style: TextStyle(color: getHighContrastBW(_targetColor)),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          color: _selectedColor,
          child: Center(
            child: Text(
              'You won ${calculatePoints(_targetColor, _selectedColor)} Points\nYour Guess\nR: ${_selectedColor.red}, G: ${_selectedColor.green}, B: ${_selectedColor.blue}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: getHighContrastBW(_selectedColor),
              ),
            ),
          ),
        ),
      ),
      RaisedButton(
        child: Text(
          'Continue',
        ),
        onPressed: _onContinuePressed,
      ),
    ];
  }

  void _onMakeGuessPressed() {
    setState(() {
      _stage = Stage.SHOW_COLOR_PICKER;
    });
  }

  void _onSubmitPressed() {
    setState(() {
      _points = _points + calculatePoints(_targetColor, _selectedColor);

      _stage = Stage.SHOW_SOLUTION;
    });
  }

  void _setNewColors() {
    setState(() {
      _targetColor = Color.fromRGBO(new Random().nextInt(255),
          new Random().nextInt(255), new Random().nextInt(255), 1.0);
    });
  }

  void _onContinuePressed() {
    _setNewColors();
    setState(() {
      _stage = Stage.SHOW_TARGET_COLOR;
    });
  }
}

int calculatePoints(Color targetColor, Color selectedColor) {
  int points = 500 -
      ((targetColor.red - selectedColor.red).abs() +
              (targetColor.green - selectedColor.green).abs() +
              (targetColor.blue - selectedColor.blue).abs()) *
          2;
  return points > 0 ? points : 0;
}
