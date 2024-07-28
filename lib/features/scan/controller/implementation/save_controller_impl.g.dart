// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveControllerImplHash() =>
    r'9d99cb94eb2057e4b50a5799f3d5c7e4187b8ab5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SaveControllerImpl
    extends BuildlessAutoDisposeNotifier<SaveModel> {
  late final FileSystemService fileSystemService;
  late final NavigationService navigationService;
  late final OcrService ocrService;
  late final CropService cropService;
  late final ImageService imageService;
  late final CarouselService carouselService;
  late final PersistenceService persistenceService;

  SaveModel build({
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required OcrService ocrService,
    required CropService cropService,
    required ImageService imageService,
    required CarouselService carouselService,
    required PersistenceService persistenceService,
  });
}

/// See also [SaveControllerImpl].
@ProviderFor(SaveControllerImpl)
const saveControllerImplProvider = SaveControllerImplFamily();

/// See also [SaveControllerImpl].
class SaveControllerImplFamily extends Family<SaveModel> {
  /// See also [SaveControllerImpl].
  const SaveControllerImplFamily();

  /// See also [SaveControllerImpl].
  SaveControllerImplProvider call({
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required OcrService ocrService,
    required CropService cropService,
    required ImageService imageService,
    required CarouselService carouselService,
    required PersistenceService persistenceService,
  }) {
    return SaveControllerImplProvider(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      ocrService: ocrService,
      cropService: cropService,
      imageService: imageService,
      carouselService: carouselService,
      persistenceService: persistenceService,
    );
  }

  @override
  SaveControllerImplProvider getProviderOverride(
    covariant SaveControllerImplProvider provider,
  ) {
    return call(
      fileSystemService: provider.fileSystemService,
      navigationService: provider.navigationService,
      ocrService: provider.ocrService,
      cropService: provider.cropService,
      imageService: provider.imageService,
      carouselService: provider.carouselService,
      persistenceService: provider.persistenceService,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveControllerImplProvider';
}

/// See also [SaveControllerImpl].
class SaveControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<SaveControllerImpl, SaveModel> {
  /// See also [SaveControllerImpl].
  SaveControllerImplProvider({
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required OcrService ocrService,
    required CropService cropService,
    required ImageService imageService,
    required CarouselService carouselService,
    required PersistenceService persistenceService,
  }) : this._internal(
          () => SaveControllerImpl()
            ..fileSystemService = fileSystemService
            ..navigationService = navigationService
            ..ocrService = ocrService
            ..cropService = cropService
            ..imageService = imageService
            ..carouselService = carouselService
            ..persistenceService = persistenceService,
          from: saveControllerImplProvider,
          name: r'saveControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveControllerImplHash,
          dependencies: SaveControllerImplFamily._dependencies,
          allTransitiveDependencies:
              SaveControllerImplFamily._allTransitiveDependencies,
          fileSystemService: fileSystemService,
          navigationService: navigationService,
          ocrService: ocrService,
          cropService: cropService,
          imageService: imageService,
          carouselService: carouselService,
          persistenceService: persistenceService,
        );

  SaveControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileSystemService,
    required this.navigationService,
    required this.ocrService,
    required this.cropService,
    required this.imageService,
    required this.carouselService,
    required this.persistenceService,
  }) : super.internal();

  final FileSystemService fileSystemService;
  final NavigationService navigationService;
  final OcrService ocrService;
  final CropService cropService;
  final ImageService imageService;
  final CarouselService carouselService;
  final PersistenceService persistenceService;

  @override
  SaveModel runNotifierBuild(
    covariant SaveControllerImpl notifier,
  ) {
    return notifier.build(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      ocrService: ocrService,
      cropService: cropService,
      imageService: imageService,
      carouselService: carouselService,
      persistenceService: persistenceService,
    );
  }

  @override
  Override overrideWith(SaveControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: SaveControllerImplProvider._internal(
        () => create()
          ..fileSystemService = fileSystemService
          ..navigationService = navigationService
          ..ocrService = ocrService
          ..cropService = cropService
          ..imageService = imageService
          ..carouselService = carouselService
          ..persistenceService = persistenceService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileSystemService: fileSystemService,
        navigationService: navigationService,
        ocrService: ocrService,
        cropService: cropService,
        imageService: imageService,
        carouselService: carouselService,
        persistenceService: persistenceService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SaveControllerImpl, SaveModel>
      createElement() {
    return _SaveControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveControllerImplProvider &&
        other.fileSystemService == fileSystemService &&
        other.navigationService == navigationService &&
        other.ocrService == ocrService &&
        other.cropService == cropService &&
        other.imageService == imageService &&
        other.carouselService == carouselService &&
        other.persistenceService == persistenceService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileSystemService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, ocrService.hashCode);
    hash = _SystemHash.combine(hash, cropService.hashCode);
    hash = _SystemHash.combine(hash, imageService.hashCode);
    hash = _SystemHash.combine(hash, carouselService.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveControllerImplRef on AutoDisposeNotifierProviderRef<SaveModel> {
  /// The parameter `fileSystemService` of this provider.
  FileSystemService get fileSystemService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `ocrService` of this provider.
  OcrService get ocrService;

  /// The parameter `cropService` of this provider.
  CropService get cropService;

  /// The parameter `imageService` of this provider.
  ImageService get imageService;

  /// The parameter `carouselService` of this provider.
  CarouselService get carouselService;

  /// The parameter `persistenceService` of this provider.
  PersistenceService get persistenceService;
}

class _SaveControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<SaveControllerImpl, SaveModel>
    with SaveControllerImplRef {
  _SaveControllerImplProviderElement(super.provider);

  @override
  FileSystemService get fileSystemService =>
      (origin as SaveControllerImplProvider).fileSystemService;
  @override
  NavigationService get navigationService =>
      (origin as SaveControllerImplProvider).navigationService;
  @override
  OcrService get ocrService =>
      (origin as SaveControllerImplProvider).ocrService;
  @override
  CropService get cropService =>
      (origin as SaveControllerImplProvider).cropService;
  @override
  ImageService get imageService =>
      (origin as SaveControllerImplProvider).imageService;
  @override
  CarouselService get carouselService =>
      (origin as SaveControllerImplProvider).carouselService;
  @override
  PersistenceService get persistenceService =>
      (origin as SaveControllerImplProvider).persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
