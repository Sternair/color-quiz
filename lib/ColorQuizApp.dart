import 'package:color_quiz/theme.dart';
import 'package:color_quiz/widgets/highscore/HighScore.dart';
import 'package:color_quiz/widgets/home/Home.dart';
import 'package:color_quiz/widgets/settings/ColorOverview.dart';
import 'package:color_quiz/widgets/settings/Settings.dart';
import 'package:flutter/material.dart';

class ColorQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/highscore': (context) => HighScore(),
        '/settings': (context) => Settings(),
        '/settings/color-overview': (context) => ColorOverview(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: COLOR_BLACK,
        focusColor: COLOR_WHITE,
        hoverColor: COLOR_WHITE,
      ),
    );
  }
}
