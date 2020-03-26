import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool _showHSVDetails = false;

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
            child: SwitchListTile(
              title: Text('Show HSV details'),
              value: _showHSVDetails,
              onChanged: _changeShowHSVDetails,
            ),
          ),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadSettingsFromStore();
  }

  _loadSettingsFromStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _showHSVDetails = prefs.getBool('showHSVDetails') ?? false;
    });
  }

  _changeShowHSVDetails(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showHSVDetails', value);
    setState(() {
      _showHSVDetails = value;
    });
  }
}
