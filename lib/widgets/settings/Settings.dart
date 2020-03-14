import 'package:color_quiz/theme.dart';
import 'package:color_quiz/widgets/common/DefaultButton.dart';
import 'package:color_quiz/widgets/settings/ColorOverview.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Text('Settings', style: TextStyle(color: COLOR_WHITE, fontSize: 40)),
          DefaultButton(
            label: 'Color Overview',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return ColorOverview();
                  },
                ),
              );
            },
            color: COLOR_WHITE,
          ),
        ],
      ),
    );
  }
}
