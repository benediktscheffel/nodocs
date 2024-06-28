import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class SaveController {
  void init(final List<String> imagePaths);
  void clear();

  String getImagePathById(final int id);
  List<Widget> getImageWidgets(final List<String> imagePaths);
  void setCurrentSliderIndex(final int index);
  int getCurrentSliderIndex();
  XFile getSelectedImageFile();
  Set<String> getTags();
  List<String> getImagePaths();
  void setCroppedImage(final CroppedFile croppedFile);
  Future<CroppedFile?> cropImage(final ThemeData theme, final XFile pickedFile, final BuildContext context);

  Future<void> checkInternetConnection();
  Future<void> savePDF(final pdf);
  Future<void> pollAndSaveDocument(final String location, final String accessToken);
  Future<String> retrieveAccessToken();
  Future<String> uploadAsset(final pw.Document pdf, final String accessToken);
  Future<String> ocrDocument(final String assetID, final String accessToken);
  Future<pw.Document> createPDF(final List<String> imagePaths);
  Future<Map<String, dynamic>> getStatusAndDownloadUri(final String location, final String accessToken);

  void showErrorDuringOcrDialog(final BuildContext context);
  void showErrorInternetDialog(final BuildContext context);
  void handleDocumentOCR(final BuildContext context, final List<String> paths);
  void goToPage(final Uri uri);
  void goBack();
}