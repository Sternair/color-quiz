import 'package:color_quiz/ColorService.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'Quiz.dart';

class QuizContainer extends StatefulWidget {
  final refreshData;

  const QuizContainer({Key key, this.refreshData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => QuizContainerState();
}

class QuizContainerState extends State<QuizContainer> {
  Future<ColorService> colorServiceFuture = ColorService.getInstance();

  @override
  Widget build(BuildContext context) {
    return I18n(
      child: Container(
        child: FutureBuilder(
          future: colorServiceFuture,
          builder:
              (BuildContext context, AsyncSnapshot<ColorService> colorService) {
            if (colorService.hasData) {
              return Quiz(
                  refreshData: widget.refreshData,
                  colorService: colorService.data);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
