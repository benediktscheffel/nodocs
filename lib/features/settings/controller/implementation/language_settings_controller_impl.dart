import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/settings/controller/language_settings_controller.dart';
import 'package:nodocs/features/settings/model/language_settings_model.dart';
import 'package:nodocs/features/settings/model/languages.dart';
import 'package:nodocs/features/settings/services/persistence/settings_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_settings_controller_impl.g.dart';

@riverpod
class LanguageSettingsControllerImpl extends _$LanguageSettingsControllerImpl
    implements LanguageSettingsController {
  @override
  LanguageSettingsModel build({
    required final SettingsPersistenceService settingsPersistenceService,
    required final NavigationService navigationService,
  }) {
    return LanguageSettingsModel(
        selectedLanguageCode: settingsPersistenceService.loadAppLanguage(),
        languages: Languages.appLanguages);
  }

  @override
  void goBack(final Uri? uri) {
    navigationService.goBack(fallbackUri: uri);
  }

  @override
  void setLanguage(final String language) {
    state = state.copyWith(selectedLanguageCode: language);
    settingsPersistenceService.saveAppLanguage(language);
  }
}
