import 'package:nodocs/config/service_locator.dart';
import 'package:nodocs/features/settings/model/settings_model.dart';
import 'package:nodocs/features/settings/services/persistence/settings_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_shared_preferences_persistence_service.g.dart';

@Riverpod(keepAlive: true)
SettingsPersistenceService settingsPersistenceService(
        final SettingsPersistenceServiceRef ref) =>
    getIt<SettingsPersistenceService>();

class SettingsSharedPreferencesPersistenceService
    implements SettingsPersistenceService {
  late final SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Settings loadSettings() {
    bool? darkMode = _sharedPreferences.getBool('darkMode');
    if (darkMode == null) {
      return const Settings(darkMode: false);
    }
    return Settings(darkMode: darkMode);
  }

  @override
  Future<void> saveDarkMode(final bool darkMode) async {
    _sharedPreferences.setBool('darkMode', darkMode);
  }
}
