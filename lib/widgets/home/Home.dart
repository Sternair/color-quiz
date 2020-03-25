import 'package:color_quiz/theme.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:color_quiz/widgets/highscore/HighScore.dart';
import 'package:color_quiz/widgets/quiz/QuizContainer.dart';
import 'package:color_quiz/widgets/settings/Settings.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: COLOR_BLACK,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultButton(
                        label: 'Start Quiz',
                        buttonType: ButtonType.action,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return QuizContainer(
                                  refreshData: () => {},
                                );
                              },
                            ),
                          );
                        },
                      ),
                      DefaultButton(
                        label: 'Highscore',
                        buttonType: ButtonType.secondary,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return HighScore();
                              },
                            ),
                          );
                        },
                      ),
                      DefaultButton(
                        label: 'Settings',
                        buttonType: ButtonType.secondary,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return Settings();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
