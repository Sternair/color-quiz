import 'dart:math';

import 'package:color_quiz/selected_color_painter.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  GlobalKey _rainbowPickerKey = GlobalKey();
  double _maxHeight;

  int _targetR;
  int _targetG;
  int _targetB;
  Color _targetColor;

  int _selectedR;
  int _selectedG;
  int _selectedB;
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
            Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: const <Color>[
                              Color(0xFFFFFFFF),
                              Color(0xFFFF0000),
                              Color(0xFF000000),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      GestureDetector(
                        onPanUpdate: (details) {
                          double y = details.localPosition.dy;
                          if (y < 0 || y > this._maxHeight) {
                            return;
                          }
                          setState(() {
                            if (y < _maxHeight / 6) {
                              // red -> yellow
                              this._selectedR = 255;
                              this._selectedG = _getMappedColorRangeValue(
                                  input: y,
                                  inputStart: 0.0,
                                  inputEnd: _maxHeight / 6,
                                  outputStart: 0,
                                  outputEnd: 255);
                              this._selectedB = 0;
                            } else if (y < _maxHeight / 6 * 2) {
                              // -> green
                              this._selectedR = _getMappedColorRangeValue(
                                  input: y,
                                  inputStart: _maxHeight / 6,
                                  inputEnd: _maxHeight / 6 * 2,
                                  outputStart: 255,
                                  outputEnd: 0);
                              this._selectedG = 255;
                              this._selectedB = 0;
                            } else if (y < _maxHeight / 6 * 3) {
                              // -> teal
                              this._selectedR = 0;
                              this._selectedG = 255;
                              this._selectedB = _getMappedColorRangeValue(
                                  input: y,
                                  inputStart: _maxHeight / 6 * 2,
                                  inputEnd: _maxHeight / 6 * 3,
                                  outputStart: 0,
                                  outputEnd: 255);
                            } else if (y < _maxHeight / 6 * 4) {
                              // -> blue
                              this._selectedR = 0;
                              this._selectedG = _getMappedColorRangeValue(
                                  input: y,
                                  inputStart: _maxHeight / 6 * 3,
                                  inputEnd: _maxHeight / 6 * 4,
                                  outputStart: 255,
                                  outputEnd: 0);
                              this._selectedB = 255;
                            } else if (y < _maxHeight / 6 * 5) {
                              // -> pink
                              this._selectedR = _getMappedColorRangeValue(
                                  input: y,
                                  inputStart: _maxHeight / 6 * 4,
                                  inputEnd: _maxHeight / 6 * 5,
                                  outputStart: 0,
                                  outputEnd: 255);
                              this._selectedG = 0;
                              this._selectedB = 255;
                            } else {
                              // -> red
                              this._selectedR = 255;
                              this._selectedG = 0;
                              this._selectedB = _getMappedColorRangeValue(
                                  input: y,
                                  inputStart: _maxHeight / 6 * 5,
                                  inputEnd: _maxHeight,
                                  outputStart: 255,
                                  outputEnd: 0);
                            }

                            this._selectedColor = Color.fromRGBO(
                                this._selectedR,
                                this._selectedG,
                                this._selectedB,
                                1.0);
//                            print('$_selectedR|$_selectedG|$_selectedB');
                            print(y);
                          });
                        },
                        child: Container(
                          key: _rainbowPickerKey,
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const <Color>[
                                Color(0xFFFF0000),
                                Color(0xFFFFFF00),
                                Color(0xFF00FF00),
                                Color(0xFF00FFFF),
                                Color(0xFF0000FF),
                                Color(0xFFFF00FF),
                                Color(0xFFFF0000),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
          ],
        ),
      ),
    );
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
    _setNewColors();
  }

  _afterLayout(_) {
    _setMaxHeight();
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

  void _setMaxHeight() {
    final RenderBox _tmp = _rainbowPickerKey.currentContext.findRenderObject();
    this._maxHeight = _tmp.size.height;
    print(this._maxHeight);
  }
}

int _getMappedColorRangeValue(
    {double inputStart,
    double inputEnd,
    double input,
    double outputStart,
    double outputEnd}) {
  return (outputStart +
          ((outputEnd - outputStart) / (inputEnd - inputStart)) *
              (input - inputStart))
      .round();
}
