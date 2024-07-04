import 'package:nodocs/features/settings/services/persistence/implementation/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_database.g.dart';

@Riverpod(keepAlive: true)
Database database(final DatabaseRef ref) => SharedPreferencesDatabase();

class SharedPreferencesDatabase implements Database {
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
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> saveString(final String key, final String value) async {
    _sharedPreferences.setString(key, value);
  }
}
