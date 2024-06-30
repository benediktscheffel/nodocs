import 'package:nodocs/config/service_locator.dart';
import 'package:nodocs/features/settings/services/persistence/database/database.dart';
import 'package:nodocs/features/settings/services/persistence/settings_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_shared_preferences_persistence_service.g.dart';

@Riverpod(keepAlive: true)
SettingsPersistenceService settingsPersistenceService(
        final SettingsPersistenceServiceRef ref) =>
    getIt<SettingsPersistenceService>();

class SettingsSharedPreferencesPersistenceService
    implements SettingsPersistenceService {
  late final Database _database;

  @override
  Future<void> init() async {
    _database = getIt<Database>();
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
