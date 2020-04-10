import 'package:color_quiz/theme.dart';
import 'package:color_quiz/widgets/highscore/HighScore.dart';
import 'package:color_quiz/widgets/home/Home.dart';
import 'package:color_quiz/widgets/settings/ColorOverview.dart';
import 'package:color_quiz/widgets/settings/LegalAndImpressum.dart';
import 'package:color_quiz/widgets/settings/ScoringInspector.dart';
import 'package:color_quiz/widgets/settings/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';

class ColorQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => I18n(child: Home()),
        '/highscore': (context) => I18n(child: HighScore()),
        '/settings': (context) => I18n(child: Settings()),
        '/settings/color-overview': (context) => ColorOverview(),
        '/settings/scoring-inspector': (context) => ScoringInspector(),
        '/settings/legal': (context) => LegalAndImpressum(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: COLOR_BLACK,
        focusColor: COLOR_WHITE,
        hoverColor: COLOR_WHITE,
        fontFamily: 'Quinngothic',
        textTheme: TextTheme(body1: TextStyle(fontSize: 20)),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('de'),
      ],
    );
  }
}
