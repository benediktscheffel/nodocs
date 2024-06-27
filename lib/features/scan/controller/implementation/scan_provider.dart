import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/implementation/scan_controller_impl.dart';
import 'package:nodocs/features/scan/controller/scan_controller.dart';
import 'package:nodocs/features/scan/model/scan_model.dart';
import 'package:nodocs/features/scan/services/camera_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'camera_provider.dart';

part 'scan_provider.g.dart';

@riverpod
NavigationService scanNavigationService(final ScanNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
CameraService cameraService(final CameraServiceRef ref) => CameraService();

@riverpod
ScanController scanController(final ScanControllerRef ref) => ref.watch(
      scanControllerImplProvider(
        navigationService: ref.watch(scanNavigationServiceProvider),
        cameraController: ref.watch(cameraControllerProvider),
      ).notifier,
    );

@riverpod
ScanModel scanModel(final ScanModelRef ref) =>
    ref.watch(
      scanControllerImplProvider(
        navigationService: ref.watch(scanNavigationServiceProvider),
        cameraController: ref.read(cameraControllerProvider),
      )
    );
