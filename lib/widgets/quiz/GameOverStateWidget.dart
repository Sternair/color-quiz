import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:color_quiz/widgets/common/TextInput.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../theme.dart';
import 'Quiz.i18n.dart';

class GameOverWidget extends StatefulWidget {
  final BuildContext context;
  final Color selectedColor;
  final int totalPoints;
  final Function onSavePressed;

  GameOverWidget(
      {this.context, this.selectedColor, this.totalPoints, this.onSavePressed});

  @override
  State<StatefulWidget> createState() => GameOverWidgetState();
}

class GameOverWidgetState extends State<GameOverWidget> {
  String _nameInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(QUIZ_BOTTOM_PADDING),
      color: widget.selectedColor,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_nameInput != null)
                    Text(
                      'Well done'.i18n +
                          '!\n' +
                          'You got %d Points'.i18n.fill([widget.totalPoints]),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: getHighContrastBW(widget.selectedColor)),
                    ),
                  if (_nameInput != null)
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: TextInputForm(
                        backgroundColor:
                            getHighContrastBW(widget.selectedColor),
                        onTextChanged: (newText) => _nameInput = newText,
                        initText: _nameInput,
                      ),
                    ),
                ],
              ),
            ),
          ),
          DefaultButton(
            label: 'Save'.i18n,
            onPressed: onSavePressed,
            color: getHighContrastBW(widget.selectedColor),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameInput = prefs.getString('userName') ?? DEFAULT_NAME;
    });
  }

  void onSavePressed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _nameInput);
    widget.onSavePressed(_nameInput, context);
  }
}
