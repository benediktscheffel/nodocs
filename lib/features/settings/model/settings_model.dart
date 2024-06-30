import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    required final Settings settings,
  }) = _SettingsModel;
}

@freezed
class Settings with _$Settings {
  const factory Settings({
    required final bool darkMode,
  }) = _Settings;
}
