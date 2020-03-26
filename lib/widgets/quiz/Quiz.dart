import 'package:color_quiz/ColorService.dart';
import 'package:color_quiz/QColor.dart';
import 'package:color_quiz/constants.dart';
import 'package:color_quiz/db/DBProvider.dart';
import 'package:color_quiz/db/entities/score.dart';
import 'package:color_quiz/widgets/quiz/ColorPickerStateWidget.dart';
import 'package:color_quiz/widgets/quiz/GameOverStateWidget.dart';
import 'package:color_quiz/widgets/quiz/SolutionStateWidget.dart';
import 'package:color_quiz/widgets/quiz/TargetColorStateWidget.dart';
import 'package:color_quiz/widgets/quiz/calculatePoints.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GameOverStateWidget.dart';
import 'QuizContainer.dart';

class Quiz extends StatefulWidget {
  final ColorService colorService;
  final refreshData;

  const Quiz({Key key, this.refreshData, @required this.colorService})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => QuizState();
}

enum Stage { SHOW_TARGET_COLOR, SHOW_COLOR_PICKER, SHOW_SOLUTION, GAME_OVER }

class QuizState extends State<Quiz> {
  QColor _targetColor;
  Color _selectedColor = Color.fromRGBO(217, 56, 166, 1.0);

  int _points = 0;
  int _round = 1;

  Stage _stage = Stage.SHOW_TARGET_COLOR;

  bool _showHSVDetails = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                      'Round $_round/$ROUNDS',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '$_points Points',
                      style: TextStyle(color: Colors.white),
                    ),
                    _getMenu(context),
                  ],
                ),
              ),
              Expanded(child: _getQuizWidgetForStage(context))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setNewTargetColor();
    _loadSettings();
  }

  void _onColorChanged(Color newSelectedColor) {
    setState(() {
      _selectedColor = newSelectedColor;
    });
  }

  Widget _getQuizWidgetForStage(BuildContext context) {
    if (_stage == Stage.SHOW_TARGET_COLOR)
      return TargetColorWidget(
        targetColor: _targetColor,
        continueToNextStage: this._onContinueToNextStage,
        currentRound: _round,
      );
    else if (_stage == Stage.SHOW_COLOR_PICKER)
      return getShowColorPickerStateWidget(
          _selectedColor, _onColorChanged, _onSubmitPressed);
    else if (_stage == Stage.SHOW_SOLUTION)
      return getShowSoultionStateWidget(
          _selectedColor,
          _targetColor,
          calculatePoints(_targetColor, _selectedColor),
          _onContinuePressed,
          _showHSVDetails,
          _round);
    else if (_stage == Stage.GAME_OVER)
      return GameOverWidget(
          context: context,
          selectedColor: _selectedColor,
          totalPoints: _points,
          onSavePressed: _onSavePressed);
    else
      return null;
  }

  void _onContinueToNextStage() {
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
      _targetColor = widget.colorService.getNewColor();
    });
  }

  void _onSavePressed(String name, BuildContext context) async {
    _setNewTargetColor();
    await DBProvider.db.insertScore(new Score(name: name, points: _points));
    widget.refreshData();
    Navigator.popAndPushNamed(context, '/highscore');
  }

  void _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _showHSVDetails = prefs.getBool('showHSVDetails') ?? false;
    });
  }
}

enum InGameMenuItemSelection { close, restart, mainMenu }

Widget _getMenu(BuildContext context) {
  return PopupMenuButton<InGameMenuItemSelection>(
    icon: Icon(Icons.menu),
    offset: Offset(0, 100),
    onSelected: (InGameMenuItemSelection result) {
      switch (result) {
        case InGameMenuItemSelection.mainMenu:
          Navigator.pop(context);
          break;
        case InGameMenuItemSelection.restart:
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return QuizContainer(
                  refreshData: () => {},
                );
              },
            ),
          );
          break;
        case InGameMenuItemSelection.close:
          break;
      }
    },
    itemBuilder: (BuildContext context) =>
        <PopupMenuEntry<InGameMenuItemSelection>>[
      const PopupMenuItem<InGameMenuItemSelection>(
        value: InGameMenuItemSelection.restart,
        child: ListTile(
          leading: Icon(Icons.replay),
          title: Text('Restart'),
          contentPadding: EdgeInsets.all(0),
        ),
      ),
      const PopupMenuItem<InGameMenuItemSelection>(
        value: InGameMenuItemSelection.mainMenu,
        child: ListTile(
          leading: Icon(Icons.home),
          title: Text('Main Menu'),
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
      const PopupMenuDivider(),
      const PopupMenuItem<InGameMenuItemSelection>(
        value: InGameMenuItemSelection.close,
        child: ListTile(
          leading: Icon(Icons.close),
          title: Text('Close'),
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
    ],
  );
}
