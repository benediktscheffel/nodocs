import 'package:nodocs/features/settings/controller/settings_controller.dart';
import 'package:nodocs/features/settings/model/Settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller_impl.g.dart';

@riverpod
class SettingsControllerImpl extends _$SettingsControllerImpl
    implements SettingsController {
  @override
  SettingsModel build(final bool darkMode) {
    return SettingsModel(darkMode: darkMode);
  }

  @override
  bool toggleDarkMode() {
    return false;
  }
}
