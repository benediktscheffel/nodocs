import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/implementation/crop_controller_impl.dart';
import 'package:nodocs/features/scan/services/crop_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';

import 'crop_controller_impl_test.mocks.dart';

@GenerateMocks(<Type>[
  NavigationService,
  CropService,
  ImageService,
])
class GeneratedMocks {}

void main() {
  late NavigationService navigationService;
  late CropService cropService;
  late ImageService imageService;
  setUp(() {
    // Initialize the generated mocks
    navigationService = MockNavigationService();
    cropService = MockCropService();
    imageService = MockImageService();
  });

  CropControllerImpl createCropController() {
    return ProviderContainer().read(cropControllerImplProvider(
      navigationService: navigationService,
      cropService: cropService,
      imageService: imageService,
    ).notifier);
  }

  test('should remove last image from image paths', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.init(imagePaths);

    // Execute
    controller.removeLastImageFromImagePaths();

    // Verify
    expect(controller.state.imagePaths, <String>['path1', 'path2']);
  });

  test('should replace image path', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.init(imagePaths);
    when(imageService.replaceImagePath('path3', 'newPath', imagePaths))
        .thenReturn(<String>['path1', 'path2', 'newPath']);

    // Execute
    controller.replaceImagePath('newPath');

    // Verify
    expect(controller.state.imagePaths, <String>['path1', 'path2', 'newPath']);
  });

  test('should go to page', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final Uri uri = Uri.parse('https://www.google.com');
    when(navigationService.push(uri.toString())).thenReturn(null);

    // Execute
    controller.goToPage(uri);

    // Verify
    verify(navigationService.push(uri.toString()));
  });

  test('should go back', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    when(navigationService.pop()).thenReturn(null);

    // Execute
    controller.goBack();

    // Verify
    verify(navigationService.pop());
  });

  test('should init', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    when(imageService.getLatestImagePath(imagePaths)).thenReturn('path3');

    // Execute
    controller.init(imagePaths);

    // Verify
    expect(controller.state.imagePaths, imagePaths);
  });

  test('should clear', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.init(imagePaths);

    // Execute
    controller.clear();

    // Verify
    expect(controller.state.imagePaths, <String>[]);
    expect(controller.state.pickedFile, null);
    expect(controller.state.croppedFile, null);
  });

  test('should get picked image', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.init(imagePaths);

    // Execute
    final XFile? pickedImage = controller.getPickedImage();

    // Verify
    expect(pickedImage, isNotNull);
    expect(pickedImage!.path, 'path3');
  });

  test('should set cropped image', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final CroppedFile croppedFile = CroppedFile('path');

    // Execute
    controller.setCroppedImage(croppedFile);

    // Verify
    expect(controller.state.croppedFile, croppedFile);
  });

  test('should get cropped image', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final CroppedFile croppedFile = CroppedFile('path');
    controller.setCroppedImage(croppedFile);

    // Execute
    final CroppedFile? result = controller.getCroppedImage();

    // Verify
    expect(result, isNotNull);
    expect(result, croppedFile);
  });

  test('should get image paths', () {
    // Setup
    final CropControllerImpl controller = createCropController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.init(imagePaths);

    // Execute
    final List<String> result = controller.getImagePaths();

    // Verify
    expect(result, imagePaths);
  });
}
