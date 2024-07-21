import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/pdfviewer/controller/implementation/pdf_viewer_controller_impl.dart';
import 'package:nodocs/features/pdfviewer/controller/pdf_viewer_controller.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';
import 'package:nodocs/features/pdfviewer/services/pdf_search_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/isar_persistence_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdf_viewer_providers.g.dart';

@riverpod
PdfSearchService pdfSearchService(final PdfSearchServiceRef ref) =>
    PdfSearchService();

@riverpod
NavigationService pdfViewerNavigationService(
        final PdfViewerNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
PdfViewerController pdfViewerController(final PdfViewerControllerRef ref) =>
    ref.watch(
      pdfViewerControllerImplProvider(
        persistenceService: ref.watch(persistenceServiceProvider),
        navigationService: ref.watch(pdfViewerNavigationServiceProvider),
        pdfSearchService: ref.watch(pdfSearchServiceProvider),
      ).notifier,
    );

@riverpod
PdfViewerModel pdfViewerModel(final PdfViewerModelRef ref) => ref.watch(
      pdfViewerControllerImplProvider(
        persistenceService: ref.watch(persistenceServiceProvider),
        navigationService: ref.watch(pdfViewerNavigationServiceProvider),
        pdfSearchService: ref.watch(pdfSearchServiceProvider),
      ),
    );
