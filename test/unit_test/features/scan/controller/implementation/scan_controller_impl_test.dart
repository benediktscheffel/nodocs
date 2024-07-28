import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/implementation/scan_controller_impl.dart';
import 'package:nodocs/features/scan/services/image_service.dart';

import 'scan_controller_impl_test.mocks.dart';

@GenerateMocks(<Type>[
  NavigationService,
  ImageService,
])
class GeneratedMocks {}

void main() {
  late NavigationService navigationService;
  late ImageService imageService;
  setUp(() {
    navigationService = MockNavigationService();
    imageService = MockImageService();
  });

  ScanControllerImpl createScanController() {
    return ProviderContainer().read(scanControllerImplProvider(
      navigationService: navigationService,
      imageService: imageService,
    ).notifier);
  }

  test('should add image path', () {
    // Setup
    final ScanControllerImpl controller = createScanController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    const String path = 'path4';
    when(imageService.addToImagePaths(imagePaths, path))
        .thenReturn(<String>['path1', 'path2', 'path3', 'path4']);

    // Execute
    final List<String> result = controller.addToImagePaths(imagePaths, path);

    // Verify
    expect(result, <String>['path1', 'path2', 'path3', 'path4']);
  });

  test('should remove image path', () {
    // Setup
    final ScanControllerImpl controller = createScanController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    when(imageService.removeFromImagePaths(imagePaths))
        .thenReturn(<String>['path1', 'path2']);

    // Execute
    final List<String> result = controller.removeFromImagePaths(imagePaths);

    // Verify
    expect(result, <String>['path1', 'path2']);
  });

  test('should get latest image path', () {
    // Setup
    final ScanControllerImpl controller = createScanController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    when(imageService.getLatestImagePath(imagePaths)).thenReturn('path3');

    // Execute
    final String result = controller.getLatestImagePath(imagePaths);

    // Verify
    expect(result, 'path3');
  });

  test('should get scan counter', () {
    // Setup
    final ScanControllerImpl controller = createScanController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];

    // Execute
    final int result = controller.getScanCounter(imagePaths);

    // Verify
    expect(result, 3);
  });

  test('should go to page', () {
    // Setup
    final ScanControllerImpl controller = createScanController();
    final Uri uri = Uri.parse('uri');

    // Execute
    controller.goToPage(uri);

    // Verify
    verify(navigationService.replaceWith(uri));
  });

  test('should go back', () {
    // Setup
    final ScanControllerImpl controller = createScanController();

    // Execute
    controller.goBack();

    // Verify
    verify(navigationService.pop());
  });
}