import 'package:nodocs/config/service_locator.dart';
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
  Future<void> saveBool(final String key, final bool value) async {
    _sharedPreferences.setBool(key, value);
  }

  @override
  bool loadBool(final String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }

  @override
  String? loadString(final String key) {
    return _sharedPreferences.getString(key) ?? null;
  }

  @override
  Future<void> saveString(final String key, final String value) async {
    _sharedPreferences.setString(key, value);
  }
}
