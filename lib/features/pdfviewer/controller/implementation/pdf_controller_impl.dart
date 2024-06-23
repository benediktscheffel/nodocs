import 'package:flutter/material.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/pdfviewer/controller/pdf_controller.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';
import 'package:nodocs/features/pdfviewer/services/pdf_search_service.dart';
import 'package:nodocs/features/tags/services/persistence/tag_persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdf_controller_impl.g.dart';

@riverpod
class PdfControllerImpl extends _$PdfControllerImpl implements PdfController {
  @override
  PdfViewerModel build({
    required final TagPersistenceService tagPersistenceService,
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
  void addTagToFile(final String filePath, final String tagName) {
    tagPersistenceService.addTagToFile(filePath, tagName).then((final _) {
      loadTags(filePath);
    });
  }

  @override
  void addTagsToFile(final String filePath, final List<String> tagNames) {
    tagPersistenceService.addTagsToFile(filePath, tagNames).then((final _) {
      loadTags(filePath);
    });
  }

  @override
  void deleteTagFromFile(final String filePath, final String tagName) {
    tagPersistenceService.deleteTagFromFile(filePath, tagName).then((final _) {
      loadTags(filePath);
    });
  }

  @override
  void goBack() {
    navigationService.pop();
  }

  @override
  void goBackMaybe() {
    navigationService.goBack();
  }

  @override
  void goBackTwice() {
    navigationService.pop();
    navigationService.pop();
  }

  @override
  void goToPage(final Uri uri) {
    navigationService.push(uri.toString());
  }

  @override
  void loadTags(final String filePath) {
    tagPersistenceService
        .loadTags(filePath)
        .then((final List<String> tagNames) {
      final List<Tag> tags =
          tagNames.map((final String tagName) => Tag(name: tagName)).toList();
      updateTags(tags);
    });
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
}
