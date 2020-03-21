import 'package:flutter/material.dart';

import '../../theme.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: COLOR_BLACK,
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Color Overview'),
                onTap: () =>
                    Navigator.pushNamed(context, '/settings/color-overview'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Scoring Inspector'),
                onTap: () =>
                    Navigator.pushNamed(context, '/settings/scoring-inspector'),
              ),
            ),
          ],
        ));
  }
}
