// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scanControllerImplHash() =>
    r'fce0d56b7584433a2a78e627b30eb778e363052a';

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

abstract class _$ScanControllerImpl
    extends BuildlessAutoDisposeNotifier<ScanModel> {
  late final NavigationService navigationService;
  late final AsyncValue<CameraController?> cameraController;

  ScanModel build({
    required NavigationService navigationService,
    required AsyncValue<CameraController?> cameraController,
  });
}

/// See also [ScanControllerImpl].
@ProviderFor(ScanControllerImpl)
const scanControllerImplProvider = ScanControllerImplFamily();

/// See also [ScanControllerImpl].
class ScanControllerImplFamily extends Family<ScanModel> {
  /// See also [ScanControllerImpl].
  const ScanControllerImplFamily();

  /// See also [ScanControllerImpl].
  ScanControllerImplProvider call({
    required NavigationService navigationService,
    required AsyncValue<CameraController?> cameraController,
  }) {
    return ScanControllerImplProvider(
      navigationService: navigationService,
      cameraController: cameraController,
    );
  }

  @override
  ScanControllerImplProvider getProviderOverride(
    covariant ScanControllerImplProvider provider,
  ) {
    return call(
      navigationService: provider.navigationService,
      cameraController: provider.cameraController,
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
  String? get name => r'scanControllerImplProvider';
}

/// See also [ScanControllerImpl].
class ScanControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<ScanControllerImpl, ScanModel> {
  /// See also [ScanControllerImpl].
  ScanControllerImplProvider({
    required NavigationService navigationService,
    required AsyncValue<CameraController?> cameraController,
  }) : this._internal(
          () => ScanControllerImpl()
            ..navigationService = navigationService
            ..cameraController = cameraController,
          from: scanControllerImplProvider,
          name: r'scanControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scanControllerImplHash,
          dependencies: ScanControllerImplFamily._dependencies,
          allTransitiveDependencies:
              ScanControllerImplFamily._allTransitiveDependencies,
          navigationService: navigationService,
          cameraController: cameraController,
        );

  ScanControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationService,
    required this.cameraController,
  }) : super.internal();

  final NavigationService navigationService;
  final AsyncValue<CameraController?> cameraController;

  @override
  ScanModel runNotifierBuild(
    covariant ScanControllerImpl notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
      cameraController: cameraController,
    );
  }

  @override
  Override overrideWith(ScanControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: ScanControllerImplProvider._internal(
        () => create()
          ..navigationService = navigationService
          ..cameraController = cameraController,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationService: navigationService,
        cameraController: cameraController,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ScanControllerImpl, ScanModel>
      createElement() {
    return _ScanControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScanControllerImplProvider &&
        other.navigationService == navigationService &&
        other.cameraController == cameraController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, cameraController.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScanControllerImplRef on AutoDisposeNotifierProviderRef<ScanModel> {
  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `cameraController` of this provider.
  AsyncValue<CameraController?> get cameraController;
}

class _ScanControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<ScanControllerImpl, ScanModel>
    with ScanControllerImplRef {
  _ScanControllerImplProviderElement(super.provider);

  @override
  NavigationService get navigationService =>
      (origin as ScanControllerImplProvider).navigationService;
  @override
  AsyncValue<CameraController?> get cameraController =>
      (origin as ScanControllerImplProvider).cameraController;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
