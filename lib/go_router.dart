import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/filesystem/pages/home_page.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/pdfviewer/pages/pdf_viewer_page.dart';
import 'package:nodocs/features/scan/pages/crop_page.dart';
import 'package:nodocs/features/scan/pages/save_page.dart';
import 'package:nodocs/features/scan/pages/scan_page.dart';
import 'package:nodocs/features/settings/pages/settings_page.dart';
import 'package:nodocs/features/settings/pages/text_recognition_language_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter goRouter(final GoRouterRef ref) => GoRouter(
      debugLogDiagnostics: kDebugMode,
      initialLocation: NavigationServiceRoutes.home,
      navigatorKey: rootNavigatorKey,
      onException: (
        final BuildContext context,
        final GoRouterState state,
        final GoRouter router,
      ) {
        debugPrint('GoRouter exception: ${state.error}');
      },
      routes: <RouteBase>[
        GoRoute(
          path: NavigationServiceRoutes.home,
          builder: (final BuildContext context, final __) => const HomePage(),
        ),
        GoRoute(
          path: '/viewer/:path',
          builder: (final BuildContext context, final GoRouterState state) {
            final String? path = state.uri.queryParameters['path'];
            return PdfViewerPage(path: path!);
          },
        ),
        GoRoute(
          path: NavigationServiceRoutes.crop,
          builder: (final BuildContext context, final GoRouterState state) {
            final String path = state.uri.queryParameters['path']!;
            return CropPage(path: path);
          },
        ),
        GoRoute(
          path: NavigationServiceRoutes.save,
          builder: (final BuildContext context, final __) => const SavePage(),
        ),
        GoRoute(
          path: NavigationServiceRoutes.scan,
          builder: (final BuildContext context, final __) => const ScanPage(),
        ),
        GoRoute(
            path: NavigationServiceRoutes.settings,
            builder: (final BuildContext context, final __) =>
                const SettingsPage()
        ),
        GoRoute(
            path: NavigationServiceRoutes.ocrLanguage,
            builder: (final BuildContext context, final __) =>
                const TextRecognitionLanguagePage()
        ),
      ],
    );
