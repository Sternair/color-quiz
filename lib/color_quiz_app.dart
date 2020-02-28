import 'package:color_quiz/highscore.dart';
import 'package:color_quiz/home.dart';
import 'package:flutter/material.dart';

class ColorQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Home(),
      '/highscore': (context) => HighScore()
    });
  }
}
