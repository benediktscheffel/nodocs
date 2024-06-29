import 'dart:async';

import 'package:nodocs/features/settings/model/settings_model.dart';

abstract class SettingsPersistenceService {
  Future<void> init();

  Settings loadSettings();
  
  Future<void> saveDarkMode(final bool darkMode);
}
