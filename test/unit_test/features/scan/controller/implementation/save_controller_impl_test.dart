import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/implementation/save_controller_impl.dart';
import 'package:nodocs/features/scan/model/collection_dropdown_model.dart';
import 'package:nodocs/features/scan/services/carousel_service.dart';
import 'package:nodocs/features/scan/services/collection_dropdown_service.dart';
import 'package:nodocs/features/scan/services/crop_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/features/scan/services/ocr_service.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';

import 'save_controller_impl_test.mocks.dart';

@GenerateMocks(<Type>[
  FileSystemService,
  NavigationService,
  OcrService,
  CropService,
  ImageService,
  CarouselService,
  PersistenceService,
  CollectionDropdownService,
])
class GeneratedMocks {}

void main() {
  late FileSystemService fileSystemService;
  late NavigationService navigationService;
  late OcrService ocrService;
  late CropService cropService;
  late ImageService imageService;
  late CarouselService carouselService;
  late PersistenceService persistenceService;
  late CollectionDropdownService collectionDropdownService;

  setUp(() {
    fileSystemService = MockFileSystemService();
    navigationService = MockNavigationService();
    ocrService = MockOcrService();
    cropService = MockCropService();
    imageService = MockImageService();
    carouselService = MockCarouselService();
    persistenceService = MockPersistenceService();
    collectionDropdownService = MockCollectionDropdownService();

    when(collectionDropdownService.getCollectionDropdown()).thenReturn(
        CollectionDropdownModel(currentPath: '/', paths: <String>[]));
  });

  SaveControllerImpl createSaveController() {
    return ProviderContainer().read(saveControllerImplProvider(
      navigationService: navigationService,
      imageService: imageService,
      ocrService: ocrService,
      cropService: cropService,
      fileSystemService: fileSystemService,
      carouselService: carouselService,
      persistenceService: persistenceService,
      collectionDropdownService: collectionDropdownService,
    ).notifier);
  }

  test('should init save controller', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    final List<String> tags = <String>['tag1', 'tag2', 'tag3'];
    when(persistenceService.loadAllTags()).thenReturn(tags);
    when(fileSystemService.getRootDirectory()).thenReturn('rootDirectory');

    // Execute
    controller.init(imagePaths);

    // Verify
    expect(controller.state.tags,
        <String, bool>{'tag1': false, 'tag2': false, 'tag3': false});
    expect(controller.state.currentSliderIndex, 0);
    expect(controller.state.imagePaths, imagePaths);
    expect(controller.state.toggleCamera, false);
    expect(controller.state.savePath, 'rootDirectory');
    expect(controller.state.title, 'save.default_title');
  });

  test('should go to page', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final Uri uri = Uri.parse('uri');

    // Execute
    controller.goToPage(uri);

    // Verify
    verify(navigationService.push(uri.toString()));
  });

  test('should go back', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();

    // Execute
    controller.goBack();

    // Verify
    verify(navigationService.pop());
  });

  test('should set current slider index', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    const int index = 1;

    // Execute
    controller.setCurrentSliderIndex(index);

    // Verify
    expect(controller.state.currentSliderIndex, index);
  });

  test('should get current slider index', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    const int index = 1;
    controller.state = controller.state.copyWith(currentSliderIndex: index);

    // Execute
    final int result = controller.getCurrentSliderIndex();

    // Verify
    expect(result, index);
  });

  test('should get tags', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final List<String> tags = <String>['tag1', 'tag2', 'tag3'];
    controller.state = controller.state.copyWith(
        tags: <String, bool>{'tag1': false, 'tag2': false, 'tag3': false});

    // Execute
    final List<String> result = controller.getTags();

    // Verify
    expect(result, tags);
  });

  test('should get image paths', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.state = controller.state.copyWith(imagePaths: imagePaths);

    // Execute
    final List<String> result = controller.getImagePaths();

    // Verify
    expect(result, imagePaths);
  });

  test('should get selected image file', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.state = controller.state
        .copyWith(imagePaths: imagePaths, currentSliderIndex: 1);

    // Execute
    final XFile result = controller.getSelectedImageFile();

    // Verify
    expect(result.path, 'path2');
  });

  test('should set edited image', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.state = controller.state
        .copyWith(imagePaths: imagePaths, currentSliderIndex: 1);
    const String path = 'path';
    when(imageService.replaceImagePath('path2', path, imagePaths))
        .thenReturn(<String>['path1', 'path', 'path3']);

    // Execute
    controller.setEditedImage(path);

    // Verify
    expect(controller.state.imagePaths, <String>['path1', 'path', 'path3']);
  });

  test('should toggle camera', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    controller.state = controller.state.copyWith(toggleCamera: false);

    // Execute
    controller.toggleCamera();

    // Verify
    expect(controller.state.toggleCamera, true);
  });

  test('should get camera state', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    controller.state = controller.state.copyWith(toggleCamera: true);

    // Execute
    final bool result = controller.getCameraState();

    // Verify
    expect(result, true);
  });

  test('should get title', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    const String title = 'title';
    controller.state = controller.state.copyWith(title: title);

    // Execute
    final String result = controller.getTitle();

    // Verify
    expect(result, title);
  });

  test('should set title', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    const String title = 'title';

    // Execute
    controller.setTitle(title);

    // Verify
    expect(controller.state.title, title);
  });

  test('should get Directory', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    const String path = 'path';
    controller.state = controller.state.copyWith(savePath: path);

    // Execute
    final String result = controller.getDirectory();

    // Verify
    expect(result, path);
  });

  test('should toggle tag', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final List<String> tags = <String>['tag1', 'tag2', 'tag3'];
    controller.state = controller.state.copyWith(
        tags: <String, bool>{'tag1': false, 'tag2': false, 'tag3': false});

    // Execute
    controller.toggleTag(tags[1]);

    // Verify
    expect(controller.state.tags,
        <String, bool>{'tag1': false, 'tag2': true, 'tag3': false});
  });

  test('should get latest image path', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final List<String> imagePaths = <String>['path1', 'path2', 'path3'];
    controller.state = controller.state.copyWith(imagePaths: imagePaths);
    when(imageService.getLatestImagePath(imagePaths)).thenReturn('path3');

    // Execute
    final String result = controller.getLatestImagePath();

    // Verify
    expect(result, 'path3');
  });

  test('should open a collection', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final CollectionDropdownModel model = CollectionDropdownModel(
        currentPath: '/path', paths: <String>['path1', 'path2', 'path3']);
    when(collectionDropdownService.openCollection('/path')).thenReturn(model);

    // Execute
    controller.openCollection()('/path');

    // Verify
    expect(controller.state.collectionDropdownModel, model);
    expect(controller.state.savePath, '/path');
  });

  test('should close a collection', () {
    // Setup
    final SaveControllerImpl controller = createSaveController();
    final CollectionDropdownModel model = CollectionDropdownModel(
        currentPath: '/path', paths: <String>['path1', 'path2', 'path3']);
    when(collectionDropdownService.closeCollection('/path')).thenReturn(model);

    // Execute
    controller.closeCollection()('/path');

    // Verify
    expect(controller.state.collectionDropdownModel, model);
    expect(controller.state.savePath, '/path');
  });
}
