import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class SaveController {
  // Model
  void init(final List<String> imagePaths);

  // Image
  List<Widget> getImageWidgets();
  void setCurrentSliderIndex(final int index);
  int getCurrentSliderIndex();
  XFile getSelectedImageFile();
  List<String> getImagePaths();
  void setEditedImage(final String path);
  Future<CroppedFile?> cropImage(final ThemeData theme, final XFile pickedFile, final BuildContext context);
  void toggleCamera();
  bool getCameraState();

  // Tags
  List<String> getTags();
  void toggleTag(final String tag);

  // Document/OCR
  Future<void> checkInternetConnection();
  Future<void> savePDF(final Future<Uint8List> pdf);
  Future<pw.Document> createPDF();
  Future<void> handleDocumentOCR();

  // Navigation
  void goToPage(final Uri uri);
  void goBack();

  // Filesystem
  String getTitle();
  void setTitle(final String title);
  String getDirectory();
  void setDirectory(final String dir);

}