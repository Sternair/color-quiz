import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations('en') +
      {
        'en': 'Start Quiz',
        'de': 'Quiz starten',
      };

  String get i18n => localize(this, _t);
}
