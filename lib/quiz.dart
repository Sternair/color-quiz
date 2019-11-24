import 'dart:math';

import 'package:color_quiz/selected_color_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

enum Stage { SHOW_TARGET_COLOR, SHOW_COLOR_PICKER, SHOW_SOLUTION }

class QuizState extends State<Quiz> {
  int _targetR;
  int _targetG;
  int _targetB;
  Color _targetColor;

  Color _selectedColor = Color.fromRGBO(0, 0, 0, 1.0);

  Color _displayColor;

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
        child: Center(
          child: CustomPaint(
            painter: SelectedColorPainter(_selectedColor),
          ),
        ),
      ),
      ColorPicker(
        pickerColor: _selectedColor,
        onColorChanged: (Color selectedColor) {
          setState(() {
            _selectedColor = selectedColor;
            print(selectedColor);
          });
        },
        enableLabel: true,
        pickerAreaHeightPercent: 0.8,
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
              'Target Color',
              style: TextStyle(color: _displayColor),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          color: _selectedColor,
          child: Center(
            child: Text(
              'Your Guess',
              style: TextStyle(color: _displayColor),
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
      _stage = Stage.SHOW_SOLUTION;
    });
  }

  void _setNewColors() {
    setState(() {
      _targetR = new Random().nextInt(255);
      _targetG = new Random().nextInt(255);
      _targetB = new Random().nextInt(255);

      _targetColor = Color.fromRGBO(_targetR, _targetG, _targetB, 1.0);
      _displayColor = _targetR + _targetG + _targetB > 382
          ? Color.fromRGBO(0, 0, 0, 1.0)
          : Color.fromRGBO(255, 255, 255, 1.0);

      print('$_targetR, $_targetG, $_targetB');
    });
  }

  void _onContinuePressed() {
    _setNewColors();
    setState(() {
      _stage = Stage.SHOW_TARGET_COLOR;
    });
  }
}
