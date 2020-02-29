import 'package:color_quiz/theme.dart';
import 'package:flutter/material.dart';

import '../../db/entities/score.dart';

Widget getHighScore(List<Score> data) {
  return FractionallySizedBox(
    heightFactor: 0.8,
    widthFactor: 0.8,
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        Score score = data[index];
        return Card(
          color: _getHighScoreColor(index),
          child: ListTile(
            leading: Text(
              '${index + 1}.',
              style: new TextStyle(color: COLOR_BLACK, fontSize: 16),
            ),
            title: Text(
              score.name,
              style: new TextStyle(color: COLOR_BLACK, fontSize: 16),
            ),
            trailing: Text(
              score.points.toString(),
              style: new TextStyle(color: COLOR_BLACK, fontSize: 16),
            ),
          ),
        );
      },
    ),
  );
}

Color _getHighScoreColor(int index) {
  switch (index) {
    case 0:
      return COLOR_GOLD;
    case 1:
      return COLOR_SILVER;
    case 2:
      return COLOR_BRONZE;
    default:
      return COLOR_WHITE;
  }
}
