
import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/crop_controller.dart';
import 'package:nodocs/features/scan/controller/implementation/crop_controller_impl.dart';
import 'package:nodocs/features/scan/model/crop_model.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crop_provider.g.dart';

@riverpod
NavigationService cropNavigationService(
    final CropNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
CropController cropController(final CropControllerRef ref) => ref.watch(
  cropControllerImplProvider(
    navigationService: ref.watch(cropNavigationServiceProvider),
  ).notifier,
);

@riverpod
CropModel cropModel(final CropModelRef ref) => ref.watch(
  cropControllerImplProvider(
    navigationService: ref.watch(cropNavigationServiceProvider),
  ),
);

