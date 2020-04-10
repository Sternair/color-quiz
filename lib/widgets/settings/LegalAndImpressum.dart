import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Settings.i18n.dart';

class LegalAndImpressum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal Notice & Privacy Policy'.i18n),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://markus-sterner.de/color-quiz/privacy-policy',
            javascriptMode: JavascriptMode.unrestricted,
          );
        },
      ),
    );
  }
}
