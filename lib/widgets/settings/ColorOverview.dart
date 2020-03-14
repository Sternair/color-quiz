import 'package:color_quiz/QColor.dart';
import 'package:color_quiz/utils/getHighContrastBW.dart';
import 'package:flutter/material.dart';

import '../../ColorService.dart';

class ColorOverview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ColorOverviewState();
}

class ColorOverviewState extends State<ColorOverview> {
  List<QColor> colors = [];
  @override
  void initState() {
    super.initState();
    ColorService.getInstance().then((colorService) {
      setState(() {
        colors = colorService.getColors();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Overview'),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Card(
            color: colors[index].toColor(),
            child: ListTile(
              title: Text(
                '${colors[index].name}',
                style: TextStyle(
                    color: getHighContrastBW(colors[index].toColor())),
              ),
            ),
          );
        },
      ),
    );
  }
}
