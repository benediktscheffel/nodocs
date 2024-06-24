import 'package:flutter/material.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';

abstract class PdfViewerController {
  get searchKey;

  get pdfViewerController;

  void goToPage(final Uri uri);

  void goBack();

  void closeDialog();

  void toggleToolbar(final bool showToolbar);

  void toggleScrollHead(final bool showScrollHead);

  void loadTags(final String filePath);

  Function(List<(String, bool)>) syncTagsWithDatabase(final String filePath);

  void updateTags(final List<Tag> tags);

  void ensureHistoryEntry(final BuildContext context);

  void showToast();

  void initSearchKey();

  void disposeSearchKey();
}
