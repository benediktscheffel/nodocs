import 'package:flutter_test/flutter_test.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/features/scan/services/implementation/image_service_impl.dart';

void main() {
  late ImageService imageService;
  setUp(() {
    imageService = ImageServiceImpl();
  });
  test('removeFromImagePaths', () {
    // Setup
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];

    // Execute
    final List<String> result = imageService.removeFromImagePaths(imagePaths);

    // Verify
    expect(result, <String>['path1', 'path2']);
  });

  test('addToImagePaths', () {
    // Setup
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];

    // Execute
    final List<String> result = imageService.addToImagePaths(imagePaths, 'path4');

    // Verify
    expect(result, <String>['path1', 'path2', 'path3', 'path4']);
  });

  test('getLatestImagePath', () {
    // Setup
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];

    // Execute
    final String result = imageService.getLatestImagePath(imagePaths);

    // Verify
    expect(result, 'path3');
  });

  test('replaceImagePath', () {
    // Setup
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];

    // Execute
    final List<String> result = imageService.replaceImagePath('path2', 'path4', imagePaths);

    // Verify
    expect(result, <String>['path1', 'path4', 'path3']);
  });

}