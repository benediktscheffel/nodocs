// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scanControllerImplHash() =>
    r'94ac8b1755b5e2d3615aac536402f950a6c56f0e';

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

  ScanModel build({
    required NavigationService navigationService,
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
  }) {
    return ScanControllerImplProvider(
      navigationService: navigationService,
    );
  }

  @override
  ScanControllerImplProvider getProviderOverride(
    covariant ScanControllerImplProvider provider,
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
  String? get name => r'scanControllerImplProvider';
}

/// See also [ScanControllerImpl].
class ScanControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<ScanControllerImpl, ScanModel> {
  /// See also [ScanControllerImpl].
  ScanControllerImplProvider({
    required NavigationService navigationService,
  }) : this._internal(
          () => ScanControllerImpl()..navigationService = navigationService,
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
        );

  ScanControllerImplProvider._internal(
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
  ScanModel runNotifierBuild(
    covariant ScanControllerImpl notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(ScanControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: ScanControllerImplProvider._internal(
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
  AutoDisposeNotifierProviderElement<ScanControllerImpl, ScanModel>
      createElement() {
    return _ScanControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScanControllerImplProvider &&
        other.navigationService == navigationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScanControllerImplRef on AutoDisposeNotifierProviderRef<ScanModel> {
  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;
}

class _ScanControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<ScanControllerImpl, ScanModel>
    with ScanControllerImplRef {
  _ScanControllerImplProviderElement(super.provider);

  @override
  NavigationService get navigationService =>
      (origin as ScanControllerImplProvider).navigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
