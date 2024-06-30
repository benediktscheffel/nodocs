import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/settings/controller/text_recognition_language_controller.dart';
import 'package:nodocs/features/settings/model/languages.dart';
import 'package:nodocs/features/settings/model/text_recognition_language_model.dart';
import 'package:nodocs/features/settings/services/persistence/settings_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_recognition_language_controller_impl.g.dart';

@riverpod
class TextRecognitionLanguageControllerImpl
    extends _$TextRecognitionLanguageControllerImpl
    implements TextRecognitionLanguageController {
  @override
  TextRecognitionLanguageModel build(
      {required final SettingsPersistenceService settingsPersistenceService,
      required final NavigationService navigationService}) {
    return TextRecognitionLanguageModel(
        selectedLanguageCode:
            settingsPersistenceService.loadTextRecognitionLanguage(),
        languages: Languages.getSortedLanguages());
  }

  @override
  void goBack(final Uri? uri) {
    navigationService.goBack(fallbackUri: uri);
  }

  @override
  void setTextRecognitionLanguage(final String language) {
    state = state.copyWith(selectedLanguageCode: language);
    settingsPersistenceService.saveTextRecognitionLanguage(language);
  }
}
