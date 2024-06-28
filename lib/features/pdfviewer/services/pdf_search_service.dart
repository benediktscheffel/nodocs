import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_search_toolbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfSearchService {
  late final PdfViewerController controller;
  LocalHistoryEntry? historyEntry;
  late GlobalKey<PdfSearchToolbarState>? textSearchKey;

  PdfSearchService() {
    controller = PdfViewerController();
  }

  void ensureHistoryEntry(final BuildContext context) {
    if (historyEntry == null) {
      final ModalRoute<void>? route = ModalRoute.of(context);
      if (route != null) {
        historyEntry = LocalHistoryEntry(onRemove: _handleHistoryEntryRemoved);
        route.addLocalHistoryEntry(historyEntry!);
      }
    }
  }

  void _handleHistoryEntryRemoved() {
    textSearchKey!.currentState?.clearSearch();
    historyEntry = null;
  }

  void showToast() {
    textSearchKey!.currentState?.showToast = true;
    Future<void>.delayed(const Duration(seconds: 1)).then((final _) {
      textSearchKey!.currentState?.showToast = false;
    });
  }

  void initKey() {
    textSearchKey = GlobalKey<PdfSearchToolbarState>();
  }

  void disposeKey() {
    textSearchKey = null;
  }

  GlobalKey<PdfSearchToolbarState> get key => textSearchKey!;

  PdfViewerController get pdfViewerController => controller;
}
