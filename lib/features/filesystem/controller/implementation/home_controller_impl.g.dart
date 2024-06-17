// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerImplHash() =>
    r'e52d1caa98f91dc823b42b5f464129f5277e43fb';

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

abstract class _$HomeControllerImpl
    extends BuildlessAutoDisposeNotifier<HomeModel> {
  late final FileSystemServiceImpl fileSystemService;

  HomeModel build({
    required FileSystemServiceImpl fileSystemService,
  });
}

/// See also [HomeControllerImpl].
@ProviderFor(HomeControllerImpl)
const homeControllerImplProvider = HomeControllerImplFamily();

/// See also [HomeControllerImpl].
class HomeControllerImplFamily extends Family<HomeModel> {
  /// See also [HomeControllerImpl].
  const HomeControllerImplFamily();

  /// See also [HomeControllerImpl].
  HomeControllerImplProvider call({
    required FileSystemServiceImpl fileSystemService,
  }) {
    return HomeControllerImplProvider(
      fileSystemService: fileSystemService,
    );
  }

  @override
  HomeControllerImplProvider getProviderOverride(
    covariant HomeControllerImplProvider provider,
  ) {
    return call(
      fileSystemService: provider.fileSystemService,
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
  String? get name => r'homeControllerImplProvider';
}

/// See also [HomeControllerImpl].
class HomeControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<HomeControllerImpl, HomeModel> {
  /// See also [HomeControllerImpl].
  HomeControllerImplProvider({
    required FileSystemServiceImpl fileSystemService,
  }) : this._internal(
          () => HomeControllerImpl()..fileSystemService = fileSystemService,
          from: homeControllerImplProvider,
          name: r'homeControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homeControllerImplHash,
          dependencies: HomeControllerImplFamily._dependencies,
          allTransitiveDependencies:
              HomeControllerImplFamily._allTransitiveDependencies,
          fileSystemService: fileSystemService,
        );

  HomeControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileSystemService,
  }) : super.internal();

  final FileSystemServiceImpl fileSystemService;

  @override
  HomeModel runNotifierBuild(
    covariant HomeControllerImpl notifier,
  ) {
    return notifier.build(
      fileSystemService: fileSystemService,
    );
  }

  @override
  Override overrideWith(HomeControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeControllerImplProvider._internal(
        () => create()..fileSystemService = fileSystemService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileSystemService: fileSystemService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HomeControllerImpl, HomeModel>
      createElement() {
    return _HomeControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeControllerImplProvider &&
        other.fileSystemService == fileSystemService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileSystemService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomeControllerImplRef on AutoDisposeNotifierProviderRef<HomeModel> {
  /// The parameter `fileSystemService` of this provider.
  FileSystemServiceImpl get fileSystemService;
}

class _HomeControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<HomeControllerImpl, HomeModel>
    with HomeControllerImplRef {
  _HomeControllerImplProviderElement(super.provider);

  @override
  FileSystemServiceImpl get fileSystemService =>
      (origin as HomeControllerImplProvider).fileSystemService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
