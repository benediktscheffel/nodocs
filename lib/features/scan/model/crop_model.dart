
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop_model.freezed.dart';

@freezed
class CropModel with _$CropModel {
  const factory CropModel({
    required final List<String> imagePaths,
  }) = _CropModel;
}