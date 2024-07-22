
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/crop_controller.dart';
import 'package:nodocs/features/scan/model/crop_model.dart';
import 'package:nodocs/features/scan/services/crop_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crop_controller_impl.g.dart';

@riverpod
class CropControllerImpl extends _$CropControllerImpl implements CropController {
  final Logger _log = getLogger();

  @override
  CropModel build({
    required final NavigationService navigationService,
    required final CropService cropService,
    required final ImageService imageService,
  }) {
    return const CropModel(
      imagePaths: <String>[],
      croppedFile: null,
      pickedFile: null,
    );
  }

  @override
  void goToPage(final Uri uri) {
    _log.i("Navigating to: ${uri.toString()}");
    navigationService.push(uri.toString());
  }

  @override
  void goBack() {
    _log.i("Going back");
    navigationService.pop();
  }

  @override
  void removeLastImageFromImagePaths() {
    _log.i("removing image: ${state.imagePaths.last}");
    String path = state.imagePaths.last;
    state = state.copyWith(imagePaths: <String>[...state.imagePaths]..remove(path));
  }

  @override
  void init(final List<String> imagePaths) {
    state = state.copyWith(imagePaths: imagePaths, pickedFile: XFile(imagePaths.last));
  }

  @override
  void clear() {
    state = state.copyWith(imagePaths: <String>[], pickedFile: null, croppedFile: null);
  }

  @override
  XFile? getPickedImage() {
    return state.pickedFile;
  }

  @override
  void setCroppedImage(final CroppedFile croppedFile) {
    state = state.copyWith(croppedFile: croppedFile);
  }

  @override
  CroppedFile? getCroppedImage() {
    return state.croppedFile;
  }

  @override
  List<String> getImagePaths() {
    return state.imagePaths;
  }

  @override
  Future<CroppedFile?> cropImage(final ThemeData theme, final XFile pickedFile, final BuildContext context) {
    return cropService.cropImage(theme, pickedFile, context);
  }

  @override
  void replaceImagePath(final String newPath) {
    _log.i("replace ${state.imagePaths.last}");
    state = state.copyWith(imagePaths: imageService.replaceImagePath(state.imagePaths.last, newPath, state.imagePaths));
  }
}