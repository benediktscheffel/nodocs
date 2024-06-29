import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/settings/controller/settings_controller.dart';
import 'package:nodocs/features/settings/model/settings_model.dart';
import 'package:nodocs/features/settings/services/persistence/settings_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller_impl.g.dart';

@riverpod
class SettingsControllerImpl extends _$SettingsControllerImpl
    implements SettingsController {
  @override
  SettingsModel build({
    required final SettingsPersistenceService settingsPersistenceService,
    required final NavigationService navigationService,
  }) {
    return SettingsModel(settings: settingsPersistenceService.loadSettings());
  }

  @override
  void toggleDarkMode() {
    state = state.copyWith(
        settings: state.settings.copyWith(darkMode: !state.settings.darkMode));
    settingsPersistenceService.saveDarkMode(state.settings.darkMode);
  }

  @override
  void goToPage(final Uri? uri) {
    navigationService.push(uri.toString());
  }
}
