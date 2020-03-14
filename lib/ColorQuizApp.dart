import 'package:color_quiz/widgets/highscore/HighScore.dart';
import 'package:color_quiz/widgets/home/Home.dart';
import 'package:color_quiz/widgets/settings/Settings.dart';
import 'package:flutter/material.dart';

class ColorQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Home(),
      '/highscore': (context) => HighScore(),
      '/settings': (context) => Settings(),
    });
  }
}
