import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/search/controller/implementation/search_result_controller_impl.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';

import 'search_result_controller_impl_test.mocks.dart';

@GenerateMocks(<Type>[
  FileSystemService,
  NavigationService,
  PersistenceService,
])
class GeneratedMocks {}

void main() {
  late FileSystemService fileSystemService;
  late NavigationService navigationService;
  late PersistenceService persistenceService;

  setUp(() {
    fileSystemService = MockFileSystemService();
    navigationService = MockNavigationService();
    persistenceService = MockPersistenceService();
  });

  SearchResultControllerImpl createSearchResultControllerImpl() {
    return ProviderContainer().read(searchResultControllerImplProvider(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      persistenceService: persistenceService,
    ).notifier);
  }

  test('should search for files tags or text occurrences', () async {
    // Setup
    when(fileSystemService.getAllPdfPaths())
        .thenAnswer((final _) async => <String>['any']);
    when(persistenceService.loadTags('any')).thenReturn(<(String, bool)>[
      ('tag1', true),
      ('tag2', false),
    ]);
    when(fileSystemService.getCountOfTextOccurrencesInPdf('any', 'any'))
        .thenAnswer((final _) async => 1);

    final SearchResultControllerImpl searchResultControllerImpl =
        createSearchResultControllerImpl();

    // Execute
    final List<String> result = await searchResultControllerImpl.search('any');

    // Verify
    expect(result, <String>['any']);
  });
}
