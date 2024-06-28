import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/pdfviewer/controller/pdf_viewer_controller.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';
import 'package:nodocs/features/pdfviewer/services/pdf_search_service.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdf_viewer_controller_impl.g.dart';

@riverpod
class PdfViewerControllerImpl extends _$PdfViewerControllerImpl
    implements PdfViewerController {
  @override
  PdfViewerModel build({
    required final PersistenceService persistenceService,
    required final NavigationService navigationService,
    required final PdfSearchService pdfSearchService,
  }) {
    return const PdfViewerModel(
      tags: <Tag>[],
      showToolbar: false,
      showScrollHead: false,
    );
  }

  @override
  void toggleToolbar(final bool showToolbar) {
    state = state.copyWith(showToolbar: showToolbar);
  }

  @override
  void toggleScrollHead(final bool showScrollHead) {
    state = state.copyWith(showScrollHead: showScrollHead);
  }

  @override
  Function(List<(String, bool)>) syncTagsWithDatabase(final String filePath) {
    return (final List<(String, bool)> tags) {
      persistenceService
          .addTagsToFile(
              filePath,
              tags
                  .filter((final (String, bool) t) => t.$2)
                  .map((final (String, bool) t) => t.$1)
                  .toList())
          .then((final _) => persistenceService
                  .deleteTagsFromFile(
                      filePath,
                      tags
                          .filter((final (String, bool) t) => !t.$2)
                          .map((final (String, bool) t) => t.$1)
                          .toList())
                  .then((final _) {
                loadTags(filePath);
              }));
    };
  }

  @override
  void goBack() {
    navigationService.goBack(
        fallbackUri: Uri(path: NavigationServiceRoutes.home));
  }

  @override
  void closeDialog() {
    navigationService.goBack(
        fallbackUri: Uri(path: NavigationServiceRoutes.pdfViewer));
  }

  @override
  void goToPage(final Uri uri) {
    navigationService.push(uri.toString());
  }

  @override
  void loadTags(final String filePath) {
    final List<Tag> tags = persistenceService
        .loadTags(filePath)
        .map((final (String, bool) tag) => Tag(name: tag.$1, selected: tag.$2))
        .toList();

    tags.sort((final Tag a, final Tag b) {
      if (a.selected == b.selected) {
        return a.name.compareTo(b.name);
      } else if (a.selected && !b.selected) {
        return -1;
      }
      return 1;
    });
    updateTags(tags);
  }

  @override
  void updateTags(final List<Tag> tags) {
    state = state.copyWith(tags: tags);
  }

  @override
  void ensureHistoryEntry(final BuildContext context) {
    pdfSearchService.ensureHistoryEntry(context);
  }

  @override
  void showToast() {
    pdfSearchService.showToast();
  }

  @override
  get searchKey => pdfSearchService.key;

  @override
  get pdfViewerController => pdfSearchService.pdfViewerController;

  @override
  void disposeSearchKey() {
    pdfSearchService.disposeKey();
  }

  @override
  void initSearchKey() {
    pdfSearchService.initKey();
  }
}
