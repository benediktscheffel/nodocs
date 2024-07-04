import 'dart:async';


abstract class SettingsPersistenceService {
  Future<void> init();

  Future<void> saveDarkMode(final bool darkMode);

  bool loadDarkMode();

  Future<void> saveTextRecognitionLanguage(final String language);

  String loadTextRecognitionLanguage();

  Future<void> saveAppLanguage(final String language);

  String loadAppLanguage();
}
