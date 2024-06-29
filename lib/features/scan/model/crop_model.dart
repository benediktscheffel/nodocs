
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';

part 'crop_model.freezed.dart';

@freezed
class CropModel with _$CropModel {
  const factory CropModel({
    required final List<String> imagePaths,
    required final CroppedFile? croppedFile,
    required final XFile? pickedFile,
  }) = _CropModel;
}