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
        title: Text('Info & Settings'),
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
          Card(
            child: SwitchListTile(
              title: Text('Show HSV details'),
              subtitle: Text(
                'Shows details about the colors on the solution screen. For people not familiar with HSV probably useless ;)',
                style: TextStyle(fontSize: 12),
              ),
              value: _showHSVDetails,
              onChanged: _changeShowHSVDetails,
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Legal Notice & Privacy Policy'),
              onTap: () => Navigator.pushNamed(context, '/settings/legal'),
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
