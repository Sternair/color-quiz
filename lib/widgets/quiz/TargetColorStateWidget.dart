import 'package:color_quiz/QColor.dart';
import 'package:color_quiz/constants.dart';
import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../common/DefaultButton.dart';

class TargetColorWidget extends StatefulWidget {
  final QColor targetColor;
  final continueToNextStage;
  final int currentRound;

  TargetColorWidget(
      {Key key,
      @required this.targetColor,
      @required this.continueToNextStage,
      @required this.currentRound})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TargetColorWidgetState();
}

class TargetColorWidgetState extends State<TargetColorWidget>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: TARGET_COLOR_MEMORIZE_DURATION),
    );
    controller.reverse(from: 1.0);
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        widget.continueToNextStage();
      }
    });
  }

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inSeconds % 60 + 1).toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.targetColor.toColor(),
        padding: EdgeInsets.only(bottom: QUIZ_BOTTOM_PADDING),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.currentRound == 1)
                    Text(
                      'Memorize this color!',
                      style: TextStyle(
                        color: getHighContrastBW(widget.targetColor.toColor()),
                        fontSize: 24,
                      ),
                    ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Text(
                        timerString,
                        style: TextStyle(
                          color:
                              getHighContrastBW(widget.targetColor.toColor()),
                          fontSize: 40.0,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  DefaultButton(
                    label: 'Continue',
                    onPressed: () => widget.continueToNextStage(),
                    color: getHighContrastBW(widget.targetColor.toColor()),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
