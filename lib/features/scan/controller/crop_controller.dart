import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

abstract class CropController {
  void removeLastImageFromImagePaths();
  void replaceImagePath(final String newPath);
  Future<CroppedFile?> cropImage(final ThemeData theme, final XFile pickedFile, final BuildContext context);
  void init(final List<String> imagePaths);
  void clear();
  XFile? getPickedImage();
  void setCroppedImage(final CroppedFile croppedFile);
  CroppedFile? getCroppedImage();
  List<String> getImagePaths();

  void goToPage(final Uri uri);
  void goBack();
  void goBackHome();
}