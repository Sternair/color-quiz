import 'dart:math';

import 'package:color_quiz/constants.dart';
import 'package:color_quiz/utils/get_high_contrast_BW.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

enum Stage { SHOW_TARGET_COLOR, SHOW_COLOR_PICKER, SHOW_SOLUTION, GAME_OVER }

class QuizState extends State<Quiz> {
  Color _targetColor;
  Color _selectedColor = Color.fromRGBO(15, 15, 15, 1.0);

  int _points = 0;
  int _round = 1;

  Stage _stage = Stage.SHOW_TARGET_COLOR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 15, 1.0),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Round $_round',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '$_points Points',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(child: _getQuizWidgetForStage())
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    _setNewTargetColor();
  }

  Widget _getQuizWidgetForStage() {
    if (_stage == Stage.SHOW_TARGET_COLOR)
      return _getShowTargetColorStateWidgets();
    else if (_stage == Stage.SHOW_COLOR_PICKER)
      return _getShowColorPickerStateWidgets();
    else if (_stage == Stage.SHOW_SOLUTION)
      return _getShowSoultionStateWidgets();
    else if (_stage == Stage.GAME_OVER)
      return _getGameOverStateWidgets();
    else
      return null;
  }

  Widget _getShowTargetColorStateWidgets() {
    return Container(
      color: _targetColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text(
                'Make a guess',
              ),
              onPressed: _onMakeGuessPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getShowColorPickerStateWidgets() {
    return Container(
      color: _selectedColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ColorPicker(
            enableAlpha: false,
            enableLabel: false,
            paletteType: PaletteType.hsv,
            pickerColor: _selectedColor,
            onColorChanged: (Color selectedColor) {
              setState(() {
                _selectedColor = selectedColor;
              });
            },
            pickerAreaHeightPercent: 1.0,
          ),
          RaisedButton(
            child: Text(
              'Submit',
            ),
            onPressed: _onSubmitPressed,
          ),
        ],
      ),
    );
  }

  Widget _getShowSoultionStateWidgets() {
    return Container(
      color: _selectedColor,
      child: Column(
        children: <Widget>[
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
        ],
      ),
    );
  }

  Widget _getGameOverStateWidgets() {
    return Container(
      color: _selectedColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Well done!\nYou got $_points Points!',
              textAlign: TextAlign.center,
              style: TextStyle(color: getHighContrastBW(_selectedColor)),
            ),
            RaisedButton(
              child: Text(
                'Try Again!',
              ),
              onPressed: _onTryAgainPressed,
            ),
          ],
        ),
      ),
    );
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

  void _onContinuePressed() {
    if (_round < ROUNDS) {
      _round++;
      _setNewTargetColor();
      setState(() {
        _stage = Stage.SHOW_TARGET_COLOR;
      });
    } else {
      setState(() {
        _stage = Stage.GAME_OVER;
      });
    }
  }

  void _setNewTargetColor() {
    setState(() {
      _targetColor = Color.fromRGBO(new Random().nextInt(255),
          new Random().nextInt(255), new Random().nextInt(255), 1.0);
    });
  }

  void _onTryAgainPressed() {
    _setNewTargetColor();
    setState(() {
      _points = 0;
      _round = 1;
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
