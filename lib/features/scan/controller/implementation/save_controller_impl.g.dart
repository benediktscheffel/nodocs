// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveControllerImplHash() =>
    r'c7289dddfab06c6ced4e3f30288c383961db9a5c';

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
  late final FileSystemServiceImpl fileSystemService;
  late final NavigationService navigationService;

  SaveModel build({
    required FileSystemServiceImpl fileSystemService,
    required NavigationService navigationService,
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
    required FileSystemServiceImpl fileSystemService,
    required NavigationService navigationService,
  }) {
    return SaveControllerImplProvider(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
    );
  }

  @override
  SaveControllerImplProvider getProviderOverride(
    covariant SaveControllerImplProvider provider,
  ) {
    return call(
      fileSystemService: provider.fileSystemService,
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
  String? get name => r'saveControllerImplProvider';
}

/// See also [SaveControllerImpl].
class SaveControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<SaveControllerImpl, SaveModel> {
  /// See also [SaveControllerImpl].
  SaveControllerImplProvider({
    required FileSystemServiceImpl fileSystemService,
    required NavigationService navigationService,
  }) : this._internal(
          () => SaveControllerImpl()
            ..fileSystemService = fileSystemService
            ..navigationService = navigationService,
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
  }) : super.internal();

  final FileSystemServiceImpl fileSystemService;
  final NavigationService navigationService;

  @override
  SaveModel runNotifierBuild(
    covariant SaveControllerImpl notifier,
  ) {
    return notifier.build(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(SaveControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: SaveControllerImplProvider._internal(
        () => create()
          ..fileSystemService = fileSystemService
          ..navigationService = navigationService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileSystemService: fileSystemService,
        navigationService: navigationService,
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
        other.navigationService == navigationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileSystemService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveControllerImplRef on AutoDisposeNotifierProviderRef<SaveModel> {
  /// The parameter `fileSystemService` of this provider.
  FileSystemServiceImpl get fileSystemService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;
}

class _SaveControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<SaveControllerImpl, SaveModel>
    with SaveControllerImplRef {
  _SaveControllerImplProviderElement(super.provider);

  @override
  FileSystemServiceImpl get fileSystemService =>
      (origin as SaveControllerImplProvider).fileSystemService;
  @override
  NavigationService get navigationService =>
      (origin as SaveControllerImplProvider).navigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
