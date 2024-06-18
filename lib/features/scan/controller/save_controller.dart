import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class SaveController {

  Future<void> checkInternetConnection();
  Future<void> savePDF(final pdf);
  Future<void> pollAndSaveDocument(final String location, final String accessToken);
  Future<String> retrieveAccessToken();
  Future<String> uploadAsset(final pw.Document pdf, final String accessToken);
  Future<String> ocrDocument(final String assetID, final String accessToken);
  Future<pw.Document> createPDF(final List<String> imagePaths);
  Future<Map<String, dynamic>> getStatusAndDownloadUri(final String location, final String accessToken);

  void showErrorDuringOcrDialog();
  void showErrorInternetDialog();
  void handleDocumentOCR(final BuildContext context);
}