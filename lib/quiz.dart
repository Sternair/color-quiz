import 'dart:math';

import 'package:color_quiz/selected_color_painter.dart';
import 'package:color_quiz/utils/custom_color_picker.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  int _targetR;
  int _targetG;
  int _targetB;
  Color _targetColor;

  Color _selectedColor = Color.fromRGBO(0, 0, 0, 1.0);

  Color _displayColor;

  int _points = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _targetColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomColorPicker(
                onColorChanged: (Color selectedColor) => this.setState(() {
                      this._selectedColor = selectedColor;
                    })),
            Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: CustomPaint(
                      painter: SelectedColorPainter(this._selectedColor),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '$_points Points',
                  style: TextStyle(color: _displayColor),
                ),
                Expanded(
                  child: Center(
                    child: RaisedButton(
                      child: Text(
                        'Make a guess',
                        style: TextStyle(color: _displayColor),
                      ),
                      onPressed: _onGuessPressed,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    _setNewColors();
  }

  _onGuessPressed() {
    _setNewColors();
  }

  _setNewColors() {
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
}
