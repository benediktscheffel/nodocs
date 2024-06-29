import 'dart:async';


abstract class SettingsPersistenceService {
  Future<void> init();

  Future<void> saveBool(final String key, final bool value);

  bool loadBool(final String key);

  Future<void> saveString(final String key, final String value);

  String? loadString(final String key);
}
