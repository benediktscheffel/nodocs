// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerImplHash() =>
    r'3360e7da2244911afd95bb2f209b057e64b6af2c';

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
  late final FileSystemService fileSystemService;
  late final NavigationService navigationService;
  late final PersistenceService persistenceService;
  late final FileShareService fileShareService;

  HomeModel build({
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required PersistenceService persistenceService,
    required FileShareService fileShareService,
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
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required PersistenceService persistenceService,
    required FileShareService fileShareService,
  }) {
    return HomeControllerImplProvider(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      persistenceService: persistenceService,
      fileShareService: fileShareService,
    );
  }

  @override
  HomeControllerImplProvider getProviderOverride(
    covariant HomeControllerImplProvider provider,
  ) {
    return call(
      fileSystemService: provider.fileSystemService,
      navigationService: provider.navigationService,
      persistenceService: provider.persistenceService,
      fileShareService: provider.fileShareService,
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
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required PersistenceService persistenceService,
    required FileShareService fileShareService,
  }) : this._internal(
          () => HomeControllerImpl()
            ..fileSystemService = fileSystemService
            ..navigationService = navigationService
            ..persistenceService = persistenceService
            ..fileShareService = fileShareService,
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
          navigationService: navigationService,
          persistenceService: persistenceService,
          fileShareService: fileShareService,
        );

  HomeControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileSystemService,
    required this.navigationService,
    required this.persistenceService,
    required this.fileShareService,
  }) : super.internal();

  final FileSystemService fileSystemService;
  final NavigationService navigationService;
  final PersistenceService persistenceService;
  final FileShareService fileShareService;

  @override
  HomeModel runNotifierBuild(
    covariant HomeControllerImpl notifier,
  ) {
    return notifier.build(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      persistenceService: persistenceService,
      fileShareService: fileShareService,
    );
  }

  @override
  Override overrideWith(HomeControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeControllerImplProvider._internal(
        () => create()
          ..fileSystemService = fileSystemService
          ..navigationService = navigationService
          ..persistenceService = persistenceService
          ..fileShareService = fileShareService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileSystemService: fileSystemService,
        navigationService: navigationService,
        persistenceService: persistenceService,
        fileShareService: fileShareService,
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
        other.fileSystemService == fileSystemService &&
        other.navigationService == navigationService &&
        other.persistenceService == persistenceService &&
        other.fileShareService == fileShareService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileSystemService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);
    hash = _SystemHash.combine(hash, fileShareService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomeControllerImplRef on AutoDisposeNotifierProviderRef<HomeModel> {
  /// The parameter `fileSystemService` of this provider.
  FileSystemService get fileSystemService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `persistenceService` of this provider.
  PersistenceService get persistenceService;

  /// The parameter `fileShareService` of this provider.
  FileShareService get fileShareService;
}

class _HomeControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<HomeControllerImpl, HomeModel>
    with HomeControllerImplRef {
  _HomeControllerImplProviderElement(super.provider);

  @override
  FileSystemService get fileSystemService =>
      (origin as HomeControllerImplProvider).fileSystemService;
  @override
  NavigationService get navigationService =>
      (origin as HomeControllerImplProvider).navigationService;
  @override
  PersistenceService get persistenceService =>
      (origin as HomeControllerImplProvider).persistenceService;
  @override
  FileShareService get fileShareService =>
      (origin as HomeControllerImplProvider).fileShareService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
