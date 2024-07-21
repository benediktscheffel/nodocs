import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';

import 'go_router_navigation_service_test.mocks.dart';

@GenerateMocks(<Type>[GoRouter])
class GeneratedMocks {}

void main() {
  late GoRouter goRouter;

  setUp(() {
    goRouter = MockGoRouter();
    when(goRouter.pop()).thenAnswer((final _) => Future<void>.value());
    when(goRouter.push('/uri')).thenAnswer((final _) => Future<void>.value());
    when(goRouter.pushReplacement('/uri')).thenAnswer((final _) => Future<void>.value());
    when(goRouter.replace('/uri')).thenAnswer((final _) => Future<void>.value());
  });

  test('GoRouterNavigationService should go back', () {
    // Setup
    final GoRouterNavigationService goRouterNavigationService =
        GoRouterNavigationService(goRouter: goRouter);
    when(goRouter.canPop()).thenReturn(true);

    // Execute
    goRouterNavigationService.goBack();

    // Verify
    verify(goRouter.canPop()).called(1);
    verify(goRouter.pop()).called(1);
  });

  test('GoRouterNavigationService should go back with fallback uri', () {
    // Setup
    when(goRouter.canPop()).thenReturn(false);
    final GoRouterNavigationService goRouterNavigationService =
        GoRouterNavigationService(goRouter: goRouter);
    final Uri fallbackUri = Uri.parse('/fallback');

    // Execute
    goRouterNavigationService.goBack(fallbackUri: fallbackUri);

    // Verify
    verify(goRouter.canPop()).called(1);
    verifyNever(goRouter.pop());
    verify(goRouter.go(fallbackUri.toString())).called(1);
  });

  test('GoRouterNavigationService should pop', () {
    // Setup
    final GoRouterNavigationService goRouterNavigationService =
        GoRouterNavigationService(goRouter: goRouter);
    const String data = 'data';

    // Execute
    goRouterNavigationService.pop(data: data);

    // Verify
    verify(goRouter.pop(data)).called(1);
  });

  test('GoRouterNavigationService should push', () {
    // Setup
    final GoRouterNavigationService goRouterNavigationService =
        GoRouterNavigationService(goRouter: goRouter);
    const String uri = '/uri';

    // Execute
    goRouterNavigationService.push(uri);

    // Verify
    verify(goRouter.push(uri)).called(1);
  });

  test('GoRouterNavigationService should replace with', () {
    // Setup
    final GoRouterNavigationService goRouterNavigationService =
        GoRouterNavigationService(goRouter: goRouter);
    final Uri uri = Uri.parse('/uri');

    // Execute
    goRouterNavigationService.replaceWith(uri);

    // Verify
    verify(goRouter.pushReplacement(uri.toString())).called(1);
  });

  test('GoRouterNavigationService should replace with named', () {
    // Setup
    final GoRouterNavigationService goRouterNavigationService =
        GoRouterNavigationService(goRouter: goRouter);
    final Uri uri = Uri.parse('/uri');

    // Execute
    goRouterNavigationService.replaceWithNamed(uri);

    // Verify
    verify(goRouter.replace(uri.toString())).called(1);
  });
}
