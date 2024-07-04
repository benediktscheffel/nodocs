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
    return _database.loadBool(_SettingsKeys.darkMode);
  }

  @override
  String loadTextRecognitionLanguage() {
    return _database.loadString(_SettingsKeys.textRecognitionLanguage) ??
        'en-GB';
  }

  @override
  Future<void> saveDarkMode(final bool darkMode) async {
    await _database.saveBool(_SettingsKeys.darkMode, darkMode);
  }

  @override
  Future<void> saveTextRecognitionLanguage(final String language) {
    return _database.saveString(_SettingsKeys.textRecognitionLanguage, language);
  }

  @override
  String loadAppLanguage() {
    return _database.loadString(_SettingsKeys.appLanguage) ?? 'en';
  }

  @override
  Future<void> saveAppLanguage(final String language) async {
    return _database.saveString(_SettingsKeys.appLanguage, language);
  }
}

class _SettingsKeys {
  static const String darkMode = 'darkMode';
  static const String textRecognitionLanguage = 'textRecognitionLanguage';
  static const String appLanguage = 'appLanguage';
}
