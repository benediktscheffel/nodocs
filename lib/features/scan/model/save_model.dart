import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_model.freezed.dart';

@freezed
class SaveModel with _$SaveModel {
  const factory SaveModel({
    required final Map<String, bool> tags,
    required final int currentSliderIndex,
    required final List<String> imagePaths,
    required final bool toggleCamera,
    required final String title,
    required final String savePath,
  }) = _SaveModel;
}