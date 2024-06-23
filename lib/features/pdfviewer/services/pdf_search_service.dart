import 'package:flutter/cupertino.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_search_toolbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfSearchService {
  late final PdfViewerController controller;
  LocalHistoryEntry? historyEntry;
  late final GlobalKey<PdfSearchToolbarState> _textSearchKey = GlobalKey();

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
    _textSearchKey.currentState?.clearSearch();
    historyEntry = null;
  }

  void showToast() {
    _textSearchKey.currentState?.showToast = true;
    Future<void>.delayed(const Duration(seconds: 1)).then((final _) {
      _textSearchKey.currentState?.showToast = false;
    });
  }

  GlobalKey<PdfSearchToolbarState> get key => _textSearchKey;

  PdfViewerController get pdfViewerController => controller;
}
