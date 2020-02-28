import 'package:color_quiz/db/DBProvider.dart';
import 'package:color_quiz/quiz.dart';
import 'package:color_quiz/theme.dart';
import 'package:color_quiz/widgets/DefaultButton.dart';
import 'package:color_quiz/widgets/HighScore.dart';
import 'package:flutter/material.dart';

import 'db/entities/score.dart';

class HighScore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HighScoreState();
}

class HighScoreState extends State<HighScore> {
  Future<List<Score>> scoreList = DBProvider.db.getAllScoresSorted();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BLACK,
      body: SafeArea(
        child: FutureBuilder(
          future: scoreList,
          builder: (BuildContext context, AsyncSnapshot<List<Score>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: getHighScore(snapshot.data)),
                  Center(
                    child: DefaultButton(
                      label: 'Start Quiz',
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return Quiz(
                                refreshData: () => _refreshData(),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void _refreshData() {
    scoreList = DBProvider.db.getAllScoresSorted();
  }
}
