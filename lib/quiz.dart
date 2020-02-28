import 'dart:math';

import 'package:color_quiz/constants.dart';
import 'package:color_quiz/db/DBProvider.dart';
import 'package:color_quiz/db/entities/score.dart';
import 'package:color_quiz/quiz/ColorPickerStateWidget.dart';
import 'package:color_quiz/quiz/GameOverStateWidget.dart';
import 'package:color_quiz/quiz/SolutionStateWidget.dart';
import 'package:color_quiz/quiz/TargetColorStateWidget.dart';
import 'package:color_quiz/quiz/calculatePoints.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final refreshData;

  const Quiz({Key key, this.refreshData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => QuizState();
}

enum Stage { SHOW_TARGET_COLOR, SHOW_COLOR_PICKER, SHOW_SOLUTION, GAME_OVER }

class QuizState extends State<Quiz> {
  Color _targetColor;
  Color _selectedColor = Color.fromRGBO(80, 10, 5, 1.0);

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
            Expanded(child: _getQuizWidgetForStage(context))
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    _setNewTargetColor();
  }

  void _onColorChanged(Color newSelectedColor) {
    setState(() {
      _selectedColor = newSelectedColor;
    });
  }

  Widget _getQuizWidgetForStage(BuildContext context) {
    if (_stage == Stage.SHOW_TARGET_COLOR)
      return getShowTargetColorStateWidget(_targetColor, _onMakeGuessPressed);
    else if (_stage == Stage.SHOW_COLOR_PICKER)
      return getShowColorPickerStateWidget(
          _selectedColor, _onColorChanged, _onSubmitPressed);
    else if (_stage == Stage.SHOW_SOLUTION)
      return getShowSoultionStateWidget(_selectedColor, _targetColor,
          calculatePoints(_selectedColor, _targetColor), _onContinuePressed);
    else if (_stage == Stage.GAME_OVER)
      return getGameOverStateWidget(
          context, _selectedColor, _points, _onSavePressed);
    else
      return null;
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

  void _onSavePressed(String name, BuildContext context) async {
    _setNewTargetColor();
    await DBProvider.db.insertScore(new Score(name: name, points: _points));
    widget.refreshData();
    Navigator.popAndPushNamed(context, '/highscore');
  }
}
