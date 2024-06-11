// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'viewer',
          factory: $PdfViewerRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings',
          factory: $SettingsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'scan',
          factory: $ScanPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'save',
          factory: $SavePageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'crop',
          factory: $CropPageRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PdfViewerRouteExtension on PdfViewerRoute {
  static PdfViewerRoute _fromState(GoRouterState state) => PdfViewerRoute(
        path: state.uri.queryParameters['path']!,
      );

  String get location => GoRouteData.$location(
        '/home/viewer',
        queryParams: {
          'path': path,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsPageRouteExtension on SettingsPageRoute {
  static SettingsPageRoute _fromState(GoRouterState state) =>
      const SettingsPageRoute();

  String get location => GoRouteData.$location(
        '/home/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ScanPageRouteExtension on ScanPageRoute {
  static ScanPageRoute _fromState(GoRouterState state) => const ScanPageRoute();

  String get location => GoRouteData.$location(
        '/home/scan',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SavePageRouteExtension on SavePageRoute {
  static SavePageRoute _fromState(GoRouterState state) => const SavePageRoute();

  String get location => GoRouteData.$location(
        '/home/save',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CropPageRouteExtension on CropPageRoute {
  static CropPageRoute _fromState(GoRouterState state) => CropPageRoute(
        path: state.uri.queryParameters['path']!,
      );

  String get location => GoRouteData.$location(
        '/home/crop',
        queryParams: {
          'path': path,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
