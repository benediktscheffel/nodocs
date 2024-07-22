// Mocks generated by Mockito 5.4.4 from annotations
// in nodocs/test/unit/features/navigation/implementation/go_router_navigation_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:flutter/widgets.dart' as _i3;
import 'package:go_router/src/configuration.dart' as _i2;
import 'package:go_router/src/delegate.dart' as _i4;
import 'package:go_router/src/information_provider.dart' as _i5;
import 'package:go_router/src/match.dart' as _i9;
import 'package:go_router/src/parser.dart' as _i6;
import 'package:go_router/src/router.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRouteConfiguration_0 extends _i1.SmartFake
    implements _i2.RouteConfiguration {
  _FakeRouteConfiguration_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBackButtonDispatcher_1 extends _i1.SmartFake
    implements _i3.BackButtonDispatcher {
  _FakeBackButtonDispatcher_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGoRouterDelegate_2 extends _i1.SmartFake
    implements _i4.GoRouterDelegate {
  _FakeGoRouterDelegate_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGoRouteInformationProvider_3 extends _i1.SmartFake
    implements _i5.GoRouteInformationProvider {
  _FakeGoRouteInformationProvider_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGoRouteInformationParser_4 extends _i1.SmartFake
    implements _i6.GoRouteInformationParser {
  _FakeGoRouteInformationParser_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GoRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoRouter extends _i1.Mock implements _i7.GoRouter {
  MockGoRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RouteConfiguration get configuration => (super.noSuchMethod(
        Invocation.getter(#configuration),
        returnValue: _FakeRouteConfiguration_0(
          this,
          Invocation.getter(#configuration),
        ),
      ) as _i2.RouteConfiguration);

  @override
  set configuration(_i2.RouteConfiguration? _configuration) =>
      super.noSuchMethod(
        Invocation.setter(
          #configuration,
          _configuration,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.BackButtonDispatcher get backButtonDispatcher => (super.noSuchMethod(
        Invocation.getter(#backButtonDispatcher),
        returnValue: _FakeBackButtonDispatcher_1(
          this,
          Invocation.getter(#backButtonDispatcher),
        ),
      ) as _i3.BackButtonDispatcher);

  @override
  _i4.GoRouterDelegate get routerDelegate => (super.noSuchMethod(
        Invocation.getter(#routerDelegate),
        returnValue: _FakeGoRouterDelegate_2(
          this,
          Invocation.getter(#routerDelegate),
        ),
      ) as _i4.GoRouterDelegate);

  @override
  set routerDelegate(_i4.GoRouterDelegate? _routerDelegate) =>
      super.noSuchMethod(
        Invocation.setter(
          #routerDelegate,
          _routerDelegate,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.GoRouteInformationProvider get routeInformationProvider =>
      (super.noSuchMethod(
        Invocation.getter(#routeInformationProvider),
        returnValue: _FakeGoRouteInformationProvider_3(
          this,
          Invocation.getter(#routeInformationProvider),
        ),
      ) as _i5.GoRouteInformationProvider);

  @override
  set routeInformationProvider(
          _i5.GoRouteInformationProvider? _routeInformationProvider) =>
      super.noSuchMethod(
        Invocation.setter(
          #routeInformationProvider,
          _routeInformationProvider,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.GoRouteInformationParser get routeInformationParser =>
      (super.noSuchMethod(
        Invocation.getter(#routeInformationParser),
        returnValue: _FakeGoRouteInformationParser_4(
          this,
          Invocation.getter(#routeInformationParser),
        ),
      ) as _i6.GoRouteInformationParser);

  @override
  set routeInformationParser(
          _i6.GoRouteInformationParser? _routeInformationParser) =>
      super.noSuchMethod(
        Invocation.setter(
          #routeInformationParser,
          _routeInformationParser,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get overridePlatformDefaultLocation => (super.noSuchMethod(
        Invocation.getter(#overridePlatformDefaultLocation),
        returnValue: false,
      ) as bool);

  @override
  bool canPop() => (super.noSuchMethod(
        Invocation.method(
          #canPop,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  String namedLocation(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedLocation,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
          },
        ),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.method(
            #namedLocation,
            [name],
            {
              #pathParameters: pathParameters,
              #queryParameters: queryParameters,
            },
          ),
        ),
      ) as String);

  @override
  void go(
    String? location, {
    Object? extra,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #go,
          [location],
          {#extra: extra},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void restore(_i9.RouteMatchList? matchList) => super.noSuchMethod(
        Invocation.method(
          #restore,
          [matchList],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goNamed(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #goNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Future<T?> push<T extends Object?>(
    String? location, {
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [location],
          {#extra: extra},
        ),
        returnValue: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);

  @override
  _i10.Future<T?> pushNamed<T extends Object?>(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);

  @override
  _i10.Future<T?> pushReplacement<T extends Object?>(
    String? location, {
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacement,
          [location],
          {#extra: extra},
        ),
        returnValue: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);

  @override
  _i10.Future<T?> pushReplacementNamed<T extends Object?>(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacementNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);

  @override
  _i10.Future<T?> replace<T>(
    String? location, {
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replace,
          [location],
          {#extra: extra},
        ),
        returnValue: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);

  @override
  _i10.Future<T?> replaceNamed<T>(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);

  @override
  void pop<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
