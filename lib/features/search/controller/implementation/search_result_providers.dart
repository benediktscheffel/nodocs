import 'package:nodocs/config/service_locator.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart';
import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/search/controller/implementation/search_result_controller_impl.dart';
import 'package:nodocs/features/search/controller/search_result_controller.dart';
import 'package:nodocs/features/search/model/search_result_model.dart';
import 'package:nodocs/features/tags/services/persistence/isar/isar_persistence_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_result_providers.g.dart';

@riverpod
NavigationService searchResultNavigationService(final SearchResultNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
FileSystemService fileSystemService(final FileSystemServiceRef ref) =>
    getIt<FileSystemService>();

@riverpod
SearchResultController searchResultController(final SearchResultControllerRef ref) => ref.watch(
  searchResultControllerImplProvider(
    fileSystemService: ref.watch(fileSystemServiceProvider),
    navigationService: ref.watch(searchResultNavigationServiceProvider),
    persistenceService: ref.watch(persistenceServiceProvider),
  ).notifier,
);

@riverpod
SearchResultModel searchResultModel(final SearchResultModelRef ref) =>
    ref.watch(searchResultControllerImplProvider(
      fileSystemService: ref.watch(fileSystemServiceProvider),
      navigationService: ref.watch(searchResultNavigationServiceProvider),
      persistenceService: ref.watch(persistenceServiceProvider),
    ));
