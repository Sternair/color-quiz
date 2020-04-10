import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations('en') +
      {
        'en': 'Info & Settings',
        'de': 'Infos & Einstellungen',
      } +
      {
        'en': 'Show HSV values',
        'de': 'Zeige HSV werte',
      } +
      {
        'en':
            'Shows details about the colors on the solution screen. For people not familiar with HSV probably useless ;)',
        'de':
            'Zeigt HSV-Werte bei der Auflösung im Quiz. Nur sinnvoll, wenn man sich mit HSV-Werten auskennt ;)',
      } +
      {
        'en': 'Legal Notice & Privacy Policy',
        'de': 'Impressum & Datenschutz',
      };

  String get i18n => localize(this, _t);
}
