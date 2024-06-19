import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class SaveController {

  String getImagePathById(final int id);

  void setCurrentSliderIndex(final int index);

  Future<void> checkInternetConnection();
  Future<void> savePDF(final pdf);
  Future<void> pollAndSaveDocument(final String location, final String accessToken);
  Future<String> retrieveAccessToken();
  Future<String> uploadAsset(final pw.Document pdf, final String accessToken);
  Future<String> ocrDocument(final String assetID, final String accessToken);
  Future<pw.Document> createPDF(final Set<String> imagePaths);
  Future<Map<String, dynamic>> getStatusAndDownloadUri(final String location, final String accessToken);

  void showErrorDuringOcrDialog(final BuildContext context);
  void showErrorInternetDialog(final BuildContext context);
  void handleDocumentOCR(final BuildContext context, final Set<String> paths);
  void setSelectedImagePath(final String path);
  void goToPage(final Uri uri);
  void goBack();
}