import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/controller/implementation/home_controller_impl.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';
import 'package:nodocs/features/filesystem/services/file_system_service.dart';
import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/isar_persistence_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

@riverpod
NavigationService homeNavigationService(final HomeNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
FileSystemService fileSystemService(final FileSystemServiceRef ref) =>
    FileSystemService();

@riverpod
HomeController homeController(final HomeControllerRef ref) => ref.watch(
      homeControllerImplProvider(
        fileSystemService: ref.watch(fileSystemServiceProvider),
        navigationService: ref.watch(homeNavigationServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
      ).notifier,
    );

@riverpod
HomeModel homeModel(final HomeModelRef ref) =>
    ref.watch(homeControllerImplProvider(
      fileSystemService: ref.watch(fileSystemServiceProvider),
      navigationService: ref.watch(homeNavigationServiceProvider),
      persistenceService: ref.watch(persistenceServiceProvider),
    ));
