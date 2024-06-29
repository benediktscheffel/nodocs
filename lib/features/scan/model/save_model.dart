import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_model.freezed.dart';

@freezed
class SaveModel with _$SaveModel {
  const factory SaveModel({
    required final Set<String> tags,
    required final int currentSliderIndex,
    required final List<String> imagePaths,
    required final bool toggleCamera,
  }) = _SaveModel;
}