import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/pdfviewer/controller/implementation/pdf_controller_impl.dart';
import 'package:nodocs/features/pdfviewer/controller/pdf_controller.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';
import 'package:nodocs/features/tags/services/persistence/isar/isar_tag_persistence_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdf_viewer_providers.g.dart';

@riverpod
NavigationService pdfViewerNavigationService(
        final PdfViewerNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
PdfController pdfViewerController(final PdfViewerControllerRef ref) =>
    ref.watch(
      pdfControllerImplProvider(
        tagPersistenceService: ref.watch(tagPersistenceServiceProvider),
        navigationService: ref.watch(pdfViewerNavigationServiceProvider),
      ).notifier,
    );

@riverpod
PdfViewerModel pdfViewerModel(final PdfViewerModelRef ref) => ref.watch(
      pdfControllerImplProvider(
        tagPersistenceService: ref.watch(tagPersistenceServiceProvider),
        navigationService: ref.watch(pdfViewerNavigationServiceProvider),
      ),
    );
