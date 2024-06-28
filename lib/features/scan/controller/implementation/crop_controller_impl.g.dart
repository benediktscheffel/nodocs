// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cropControllerImplHash() =>
    r'f0ddb137d7d9ea87b50b9d7f19bc77491afaf0ae';

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

  CropModel build({
    required NavigationService navigationService,
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
  }) {
    return CropControllerImplProvider(
      navigationService: navigationService,
    );
  }

  @override
  CropControllerImplProvider getProviderOverride(
    covariant CropControllerImplProvider provider,
  ) {
    return call(
      navigationService: provider.navigationService,
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
  }) : this._internal(
          () => CropControllerImpl()..navigationService = navigationService,
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
        );

  CropControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationService,
  }) : super.internal();

  final NavigationService navigationService;

  @override
  CropModel runNotifierBuild(
    covariant CropControllerImpl notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(CropControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: CropControllerImplProvider._internal(
        () => create()..navigationService = navigationService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationService: navigationService,
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
        other.navigationService == navigationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CropControllerImplRef on AutoDisposeNotifierProviderRef<CropModel> {
  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;
}

class _CropControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<CropControllerImpl, CropModel>
    with CropControllerImplRef {
  _CropControllerImplProviderElement(super.provider);

  @override
  NavigationService get navigationService =>
      (origin as CropControllerImplProvider).navigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
