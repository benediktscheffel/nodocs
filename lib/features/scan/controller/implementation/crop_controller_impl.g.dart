// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cropControllerImplHash() =>
    r'46de7e1098abfb7f6ede687ff199b82623710ea0';

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

abstract class _$CropControllerImpl
    extends BuildlessAutoDisposeNotifier<CropModel> {
  late final NavigationService navigationService;
  late final CropService cropService;
  late final ImageService imageService;

  CropModel build({
    required NavigationService navigationService,
    required CropService cropService,
    required ImageService imageService,
  });
}

/// See also [CropControllerImpl].
@ProviderFor(CropControllerImpl)
const cropControllerImplProvider = CropControllerImplFamily();

/// See also [CropControllerImpl].
class CropControllerImplFamily extends Family<CropModel> {
  /// See also [CropControllerImpl].
  const CropControllerImplFamily();

  /// See also [CropControllerImpl].
  CropControllerImplProvider call({
    required NavigationService navigationService,
    required CropService cropService,
    required ImageService imageService,
  }) {
    return CropControllerImplProvider(
      navigationService: navigationService,
      cropService: cropService,
      imageService: imageService,
    );
  }

  @override
  CropControllerImplProvider getProviderOverride(
    covariant CropControllerImplProvider provider,
  ) {
    return call(
      navigationService: provider.navigationService,
      cropService: provider.cropService,
      imageService: provider.imageService,
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
  String? get name => r'cropControllerImplProvider';
}

/// See also [CropControllerImpl].
class CropControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<CropControllerImpl, CropModel> {
  /// See also [CropControllerImpl].
  CropControllerImplProvider({
    required NavigationService navigationService,
    required CropService cropService,
    required ImageService imageService,
  }) : this._internal(
          () => CropControllerImpl()
            ..navigationService = navigationService
            ..cropService = cropService
            ..imageService = imageService,
          from: cropControllerImplProvider,
          name: r'cropControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cropControllerImplHash,
          dependencies: CropControllerImplFamily._dependencies,
          allTransitiveDependencies:
              CropControllerImplFamily._allTransitiveDependencies,
          navigationService: navigationService,
          cropService: cropService,
          imageService: imageService,
        );

  CropControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationService,
    required this.cropService,
    required this.imageService,
  }) : super.internal();

  final NavigationService navigationService;
  final CropService cropService;
  final ImageService imageService;

  @override
  CropModel runNotifierBuild(
    covariant CropControllerImpl notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
      cropService: cropService,
      imageService: imageService,
    );
  }

  @override
  Override overrideWith(CropControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: CropControllerImplProvider._internal(
        () => create()
          ..navigationService = navigationService
          ..cropService = cropService
          ..imageService = imageService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationService: navigationService,
        cropService: cropService,
        imageService: imageService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CropControllerImpl, CropModel>
      createElement() {
    return _CropControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CropControllerImplProvider &&
        other.navigationService == navigationService &&
        other.cropService == cropService &&
        other.imageService == imageService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, cropService.hashCode);
    hash = _SystemHash.combine(hash, imageService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CropControllerImplRef on AutoDisposeNotifierProviderRef<CropModel> {
  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `cropService` of this provider.
  CropService get cropService;

  /// The parameter `imageService` of this provider.
  ImageService get imageService;
}

class _CropControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<CropControllerImpl, CropModel>
    with CropControllerImplRef {
  _CropControllerImplProviderElement(super.provider);

  @override
  NavigationService get navigationService =>
      (origin as CropControllerImplProvider).navigationService;
  @override
  CropService get cropService =>
      (origin as CropControllerImplProvider).cropService;
  @override
  ImageService get imageService =>
      (origin as CropControllerImplProvider).imageService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
