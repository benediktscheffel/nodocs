import 'package:nodocs/config/service_locator.dart';
import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/implementation/scan_controller_impl.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/model/scan_model.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_provider.g.dart';

@riverpod
NavigationService scanNavigationService(final ScanNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
ImageService imageService(final ImageServiceRef ref) => getIt<ImageService>();

@riverpod
ScanController scanController(final ScanControllerRef ref) => ref.watch(
      scanControllerImplProvider(
        navigationService: ref.watch(scanNavigationServiceProvider),
        imageService: ref.watch(imageServiceProvider),
      ).notifier,
    );

@riverpod
ScanModel scanModel(final ScanModelRef ref) =>
    ref.watch(scanControllerImplProvider(
      navigationService: ref.watch(scanNavigationServiceProvider),
      imageService: ref.watch(imageServiceProvider),
    ));
