import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_navigation_service.g.dart';

@riverpod
goRouterNavigationService(final GoRouterNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

class GoRouterNavigationService extends NavigationService {
  final GoRouter _router;

  GoRouterNavigationService({
    required final GoRouter goRouter,
  }) : _router = goRouter;

  @override
  void goBack({final Uri? fallbackUri}) {
    if (_router.canPop()) {
      _router.pop();
    } else if (fallbackUri != null) {
      _router.go(fallbackUri.toString());
    }
  }

  @override
  void pop<T>({final T? data}) {
    _router.pop(data);
  }

  @override
  void push(final String uri) {
    unawaited(_router.push(uri));
  }

  @override
  void replaceWith(final Uri uri) {
    _router.pushReplacement(uri.toString());
  }

  @override
  void replaceWithNamed(final Uri uri) {
    _router.replace(uri.toString());
  }

  @override
  TaskEither<Object, Option<T>> showPopup<T>(
      final Widget popup, {
        final bool canBePoppedViaBackGesture = true,
      }) =>
      optionOf(_router.routerDelegate.navigatorKey.currentContext).fold(
            () => TaskEither<Object, Option<T>>(
              () async =>
              left('Error when searching for context - navigation service'),
        ),
            (final BuildContext context) => TaskEither<Object, Option<T>>.tryCatch(
              () async => optionOf(
            await showDialog<T>(
              context: context,
              builder: (final _) => PopScope(
                child: popup,
              ),
            ),
          ),
              (final Object error, final _) => error,
        ),
      );
}
