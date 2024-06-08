import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_viewer.dart';
import 'package:nodocs/features/presentation/pages/widgets_page.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';

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
  ]
)

@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return const WidgetsPage();
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