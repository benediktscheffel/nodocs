import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_viewer.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/pages/crop_page.dart';
import 'package:nodocs/features/scan/pages/save_page.dart';
import 'package:nodocs/features/scan/pages/scan_page.dart';
import 'package:nodocs/features/settings/pages/settings_page.dart';
import 'package:nodocs/pages/home_page.dart';

part 'go_router.g.dart';

GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: const HomeRoute().location,
);

@TypedGoRoute<HomeRoute>(
  path: NavigationServiceRoutes.home,
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<PdfViewerRoute>(
      path: NavigationServiceRoutes.pdfViewer,
    ),
    TypedGoRoute<SettingsPageRoute>(
      path: NavigationServiceRoutes.settings,
    ),
    TypedGoRoute<ScanPageRoute>(
      path: NavigationServiceRoutes.scan,
    ),
    TypedGoRoute<SavePageRoute>(
      path: NavigationServiceRoutes.save,
    ),
    TypedGoRoute<CropPageRoute>(
      path: NavigationServiceRoutes.crop,
    ),
  ]
)

@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return const HomePage();
  }
}

@immutable
class PdfViewerRoute extends GoRouteData {
  final String path;
  const PdfViewerRoute({required this.path});

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return PdfViewer(path: path);
  }
}

@immutable
class CropPageRoute extends GoRouteData {
  final String path;
  const CropPageRoute({required this.path});

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return CropPage(path: path);
  }
}

@immutable
class SavePageRoute extends GoRouteData {
  const SavePageRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return const SavePage();
  }
}

@immutable
class ScanPageRoute extends GoRouteData {
  const ScanPageRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return const ScanPage();
  }
}

@immutable
class SettingsPageRoute extends GoRouteData {
  const SettingsPageRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return const SettingsPage();
  }
}