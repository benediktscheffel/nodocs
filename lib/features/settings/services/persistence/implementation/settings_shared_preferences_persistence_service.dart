import 'package:nodocs/features/settings/services/persistence/implementation/database/database.dart';
import 'package:nodocs/features/settings/services/persistence/settings_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'database/shared_preferences_database.dart';

part 'settings_shared_preferences_persistence_service.g.dart';

@Riverpod(keepAlive: true)
SettingsPersistenceService settingsPersistenceService(
        final SettingsPersistenceServiceRef ref) =>
    SettingsSharedPreferencesPersistenceService(
        database: ref.read(databaseProvider));

class SettingsSharedPreferencesPersistenceService
    implements SettingsPersistenceService {
  late final Database _database;

  SettingsSharedPreferencesPersistenceService(
      {required final Database database})
      : _database = database;

  @override
  Future<void> init() async {
    await _database.init();
  }

  @override
  bool loadDarkMode() {
    return _database.loadBool(SettingsKeys.darkMode);
  }

  @override
  String loadTextRecognitionLanguage() {
    return _database.loadString(SettingsKeys.textRecognitionLanguage) ??
        'de-DE';
  }

  @override
  Future<void> saveDarkMode(final bool darkMode) async {
    await _database.saveBool(SettingsKeys.darkMode, darkMode);
  }

  @override
  Future<void> saveTextRecognitionLanguage(final String language) {
    return _database.saveString(SettingsKeys.textRecognitionLanguage, language);
  }
}

class SettingsKeys {
  static const String darkMode = 'darkMode';
  static const String textRecognitionLanguage = 'textRecognitionLanguage';
}
