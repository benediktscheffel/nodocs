// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchResultControllerImplHash() =>
    r'c4325cf5b8ab98b637f2eed04a1215256953eb34';

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

abstract class _$SearchResultControllerImpl
    extends BuildlessAutoDisposeNotifier<SearchResultModel> {
  late final FileSystemService fileSystemService;
  late final NavigationService navigationService;
  late final PersistenceService persistenceService;

  SearchResultModel build({
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required PersistenceService persistenceService,
  });
}

/// See also [SearchResultControllerImpl].
@ProviderFor(SearchResultControllerImpl)
const searchResultControllerImplProvider = SearchResultControllerImplFamily();

/// See also [SearchResultControllerImpl].
class SearchResultControllerImplFamily extends Family<SearchResultModel> {
  /// See also [SearchResultControllerImpl].
  const SearchResultControllerImplFamily();

  /// See also [SearchResultControllerImpl].
  SearchResultControllerImplProvider call({
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required PersistenceService persistenceService,
  }) {
    return SearchResultControllerImplProvider(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      persistenceService: persistenceService,
    );
  }

  @override
  SearchResultControllerImplProvider getProviderOverride(
    covariant SearchResultControllerImplProvider provider,
  ) {
    return call(
      fileSystemService: provider.fileSystemService,
      navigationService: provider.navigationService,
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
  String? get name => r'searchResultControllerImplProvider';
}

/// See also [SearchResultControllerImpl].
class SearchResultControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<SearchResultControllerImpl,
        SearchResultModel> {
  /// See also [SearchResultControllerImpl].
  SearchResultControllerImplProvider({
    required FileSystemService fileSystemService,
    required NavigationService navigationService,
    required PersistenceService persistenceService,
  }) : this._internal(
          () => SearchResultControllerImpl()
            ..fileSystemService = fileSystemService
            ..navigationService = navigationService
            ..persistenceService = persistenceService,
          from: searchResultControllerImplProvider,
          name: r'searchResultControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchResultControllerImplHash,
          dependencies: SearchResultControllerImplFamily._dependencies,
          allTransitiveDependencies:
              SearchResultControllerImplFamily._allTransitiveDependencies,
          fileSystemService: fileSystemService,
          navigationService: navigationService,
          persistenceService: persistenceService,
        );

  SearchResultControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileSystemService,
    required this.navigationService,
    required this.persistenceService,
  }) : super.internal();

  final FileSystemService fileSystemService;
  final NavigationService navigationService;
  final PersistenceService persistenceService;

  @override
  SearchResultModel runNotifierBuild(
    covariant SearchResultControllerImpl notifier,
  ) {
    return notifier.build(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      persistenceService: persistenceService,
    );
  }

  @override
  Override overrideWith(SearchResultControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchResultControllerImplProvider._internal(
        () => create()
          ..fileSystemService = fileSystemService
          ..navigationService = navigationService
          ..persistenceService = persistenceService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileSystemService: fileSystemService,
        navigationService: navigationService,
        persistenceService: persistenceService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SearchResultControllerImpl,
      SearchResultModel> createElement() {
    return _SearchResultControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultControllerImplProvider &&
        other.fileSystemService == fileSystemService &&
        other.navigationService == navigationService &&
        other.persistenceService == persistenceService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileSystemService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchResultControllerImplRef
    on AutoDisposeNotifierProviderRef<SearchResultModel> {
  /// The parameter `fileSystemService` of this provider.
  FileSystemService get fileSystemService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `persistenceService` of this provider.
  PersistenceService get persistenceService;
}

class _SearchResultControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<SearchResultControllerImpl,
        SearchResultModel> with SearchResultControllerImplRef {
  _SearchResultControllerImplProviderElement(super.provider);

  @override
  FileSystemService get fileSystemService =>
      (origin as SearchResultControllerImplProvider).fileSystemService;
  @override
  NavigationService get navigationService =>
      (origin as SearchResultControllerImplProvider).navigationService;
  @override
  PersistenceService get persistenceService =>
      (origin as SearchResultControllerImplProvider).persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
