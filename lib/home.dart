import 'package:color_quiz/highscore.dart';
import 'package:color_quiz/quiz.dart';
import 'package:color_quiz/theme.dart';
import 'package:color_quiz/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: COLOR_BLACK,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Center(
                child: Column(
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
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
