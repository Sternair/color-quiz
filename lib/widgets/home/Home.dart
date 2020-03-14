import 'package:color_quiz/theme.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:color_quiz/widgets/highscore/HighScore.dart';
import 'package:color_quiz/widgets/quiz/Quiz.dart';
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return Quiz(
                                  refreshData: () => {},
                                );
                              },
                            ),
                          );
                        },
                      ),
                      DefaultButton(
                        label: 'Highscore',
                        outline: false,
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
                      /*Container(
                        child: AutoSizeText(
                          'A really long String',
                          style: TextStyle(fontSize: 30, color: COLOR_WHITE),
                          minFontSize: 10,
                          maxFontSize: 40,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),*/
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