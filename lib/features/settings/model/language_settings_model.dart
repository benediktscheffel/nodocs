import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_settings_model.freezed.dart';

@freezed
class LanguageSettingsModel with _$LanguageSettingsModel {
  const factory LanguageSettingsModel(
      {required final String selectedLanguageCode,
      required final Map<String, String> languages}) = _LanguageSettingsModel;
}
