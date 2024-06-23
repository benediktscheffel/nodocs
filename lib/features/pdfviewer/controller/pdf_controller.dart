import 'package:flutter/material.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';

abstract class PdfController {
  get searchKey;

  get pdfViewerController;

  void goToPage(final Uri uri);

  void goBack();

  void goBackMaybe();

  void goBackTwice();

  void toggleToolbar(final bool showToolbar);

  void toggleScrollHead(final bool showScrollHead);

  void loadTags(final String filePath);

  void addTagToFile(final String filePath, final String tagName);

  void deleteTagFromFile(final String filePath, final String tagName);

  void addTagsToFile(final String filePath, final List<String> tagNames);

  void updateTags(final List<Tag> tags);

  void ensureHistoryEntry(final BuildContext context);

  void showToast();
}
