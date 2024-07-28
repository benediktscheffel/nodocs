import 'package:nodocs/config/service_locator.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/implementation/file_system_service_impl.dart';
import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/scan/controller/implementation/save_controller_impl.dart';
import 'package:nodocs/features/scan/controller/save_controller.dart';
import 'package:nodocs/features/scan/model/save_model.dart';
import 'package:nodocs/features/scan/services/carousel_service.dart';
import 'package:nodocs/features/scan/services/collection_dropdown_service.dart';
import 'package:nodocs/features/scan/services/crop_service.dart';
import 'package:nodocs/features/scan/services/image_service.dart';
import 'package:nodocs/features/scan/services/ocr_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/isar_persistence_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_provider.g.dart';

@riverpod
NavigationService saveNavigationService(final SaveNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
FileSystemServiceImpl fileSystemService(final FileSystemServiceRef ref) =>
    FileSystemServiceImpl();

@riverpod
OcrService ocrService(final OcrServiceRef ref) => getIt<OcrService>();

@riverpod
CropService cropService(final CropServiceRef ref) => getIt<CropService>();

@riverpod
CarouselService carouselService(final CarouselServiceRef ref) =>
    getIt<CarouselService>();

@riverpod
ImageService imageService(final ImageServiceRef ref) => getIt<ImageService>();

@riverpod
CollectionDropdownService collectionDropdownService(final CollectionDropdownServiceRef ref) =>
    getIt<CollectionDropdownService>();

@riverpod
SaveController saveController(final SaveControllerRef ref) => ref.watch(
      saveControllerImplProvider(
        fileSystemService: ref.watch(fileSystemServiceProvider),
        navigationService: ref.watch(saveNavigationServiceProvider),
        ocrService: ref.watch(ocrServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
        cropService: ref.watch(cropServiceProvider),
        carouselService: ref.watch(carouselServiceProvider),
        imageService: ref.watch(imageServiceProvider),
        collectionDropdownService: ref.watch(collectionDropdownServiceProvider),
      ).notifier,
    );

@riverpod
SaveModel saveModel(final SaveModelRef ref) => ref.watch(
      saveControllerImplProvider(
        fileSystemService: ref.watch(fileSystemServiceProvider),
        navigationService: ref.watch(saveNavigationServiceProvider),
        ocrService: ref.watch(ocrServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
        cropService: ref.watch(cropServiceProvider),
        carouselService: ref.watch(carouselServiceProvider),
        imageService: ref.watch(imageServiceProvider),
        collectionDropdownService: ref.watch(collectionDropdownServiceProvider),
      ),
    );
