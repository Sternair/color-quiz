import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations('en') +
      {
        'en': 'Round',
        'de': 'Runde',
      } +
      {
        'en': 'Points',
        'de': 'Punkte',
      } +
      {
        'en': 'Select',
        'de': 'Auswählen',
      } +
      {
        'en': 'Memorize this color!',
        'de': 'Merke dir diese Farbe!',
      } +
      {
        'en': 'Continue',
        'de': 'Weiter',
      } +
      {
        'en': 'Target Color Name',
        'de': 'Name der gesuchten Farbe',
      } +
      {
        'en': 'Guess',
        'de': 'Geraten',
      } +
      {
        'en': 'Target',
        'de': 'Ziel',
      } +
      {
        'en': 'Finish Game',
        'de': 'Spiel beenden',
      } +
      {
        'en': 'Next Round',
        'de': 'Nächste Runde',
      } +
      {
        'en': 'Well done',
        'de': 'Gut gemacht',
      } +
      {
        'en': 'You got %d Points',
        'de': 'Du hast %d Punkte',
      } +
      {
        'en': 'Save',
        'de': 'Speichern',
      };

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);
}
