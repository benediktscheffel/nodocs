import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/pdfviewer/controller/implementation/pdf_viewer_controller_impl.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';
import 'package:nodocs/features/pdfviewer/services/pdf_search_service.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';

import 'pdf_viewer_controller_impl_test.mocks.dart';

@GenerateMocks(<Type>[
  PersistenceService,
  NavigationService,
  PdfSearchService,
])
class GeneratedMocks {}

void main() {
  late PersistenceService persistenceService;
  late NavigationService navigationService;
  late PdfSearchService pdfSearchService;

  setUp(() {
    persistenceService = MockPersistenceService();
    navigationService = MockNavigationService();
    pdfSearchService = MockPdfSearchService();

    when(persistenceService.addTagsToFile('path', <String>[]))
        .thenAnswer((final _) async {});

    when(persistenceService.addTagsToFile('path', <String>['tag1']))
        .thenAnswer((final _) async {});

    when(persistenceService.loadTags('path'))
        .thenAnswer((final _) => <(String, bool)>[('tag1', true)]);
  });

  PdfViewerControllerImpl createPdfViewerController() {
    return ProviderContainer().read(
      pdfViewerControllerImplProvider(
        navigationService: navigationService,
        persistenceService: persistenceService,
        pdfSearchService: pdfSearchService,
      ).notifier,
    );
  }

  test('PdfViewerController should toggle toolbar', () {
    // Setup
    final PdfViewerControllerImpl pdfViewerController =
        createPdfViewerController();

    // Execute
    pdfViewerController.toggleToolbar(true);

    // Verify
    expect(pdfViewerController.state.showToolbar, true);
  });

  test('PdfViewerController should toggle scroll head', () {
    // Setup
    final PdfViewerControllerImpl pdfViewerController =
        createPdfViewerController();

    // Execute
    pdfViewerController.toggleScrollHead(true);

    // Verify
    expect(pdfViewerController.state.showScrollHead, true);
  });

  test('PdfViewerController should sync tags with database', () async {
    // Setup
    final PdfViewerControllerImpl pdfViewerController =
        createPdfViewerController();

    // Execute
    pdfViewerController
        .syncTagsWithDatabase('path')(<(String, bool)>[('tag1', true)]);

    // Verify
    verify(persistenceService.addTagsToFile('path', <String>['tag1']))
        .called(1);
  });

  test('PdfViewerController should go back', () {
    // Setup
    final PdfViewerControllerImpl pdfViewerController =
        createPdfViewerController();

    // Execute
    pdfViewerController.goBack();

    // Verify
    verify(navigationService.goBack(
            fallbackUri: Uri(path: NavigationServiceRoutes.home)))
        .called(1);
  });

  test('PdfViewerController should close dialog', () {
    // Setup
    final PdfViewerControllerImpl pdfViewerController =
        createPdfViewerController();

    // Execute
    pdfViewerController.closeDialog();

    // Verify
    verify(navigationService.goBack(
            fallbackUri: Uri(path: NavigationServiceRoutes.pdfViewer)))
        .called(1);
  });

  test('PdfViewerController should load tags', () {
    // Setup
    final PdfViewerControllerImpl pdfViewerController =
        createPdfViewerController();

    // Execute
    pdfViewerController.updateTags(pdfViewerController.loadTags('path'));

    // Verify
    expect(pdfViewerController.state.tags,
        <Tag>[const Tag(name: 'tag1', selected: true)]);
  });

  test('PdfViewerController should go to page', () {
    // Setup
    final PdfViewerControllerImpl pdfViewerController =
        createPdfViewerController();

    // Execute
    pdfViewerController.goToPage(Uri());

    // Verify
    verify(navigationService.push('')).called(1);
  });
}
