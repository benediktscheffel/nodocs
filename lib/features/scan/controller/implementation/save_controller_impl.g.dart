// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveControllerImplHash() =>
    r'55080950ac6731f8aa9013962d8d0d5bd677033d';

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
  late final OcrService ocrService;
  late final PersistenceService persistenceService;

  SaveModel build({
    required FileSystemServiceImpl fileSystemService,
    required NavigationService navigationService,
    required OcrService ocrService,
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
    required FileSystemServiceImpl fileSystemService,
    required NavigationService navigationService,
    required OcrService ocrService,
    required PersistenceService persistenceService,
  }) {
    return SaveControllerImplProvider(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      ocrService: ocrService,
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
    required FileSystemServiceImpl fileSystemService,
    required NavigationService navigationService,
    required OcrService ocrService,
    required PersistenceService persistenceService,
  }) : this._internal(
          () => SaveControllerImpl()
            ..fileSystemService = fileSystemService
            ..navigationService = navigationService
            ..ocrService = ocrService
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
    required this.persistenceService,
  }) : super.internal();

  final FileSystemServiceImpl fileSystemService;
  final NavigationService navigationService;
  final OcrService ocrService;
  final PersistenceService persistenceService;

  @override
  SaveModel runNotifierBuild(
    covariant SaveControllerImpl notifier,
  ) {
    return notifier.build(
      fileSystemService: fileSystemService,
      navigationService: navigationService,
      ocrService: ocrService,
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
          ..persistenceService = persistenceService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileSystemService: fileSystemService,
        navigationService: navigationService,
        ocrService: ocrService,
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
        other.persistenceService == persistenceService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileSystemService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, ocrService.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveControllerImplRef on AutoDisposeNotifierProviderRef<SaveModel> {
  /// The parameter `fileSystemService` of this provider.
  FileSystemServiceImpl get fileSystemService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `ocrService` of this provider.
  OcrService get ocrService;

  /// The parameter `persistenceService` of this provider.
  PersistenceService get persistenceService;
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
  @override
  OcrService get ocrService =>
      (origin as SaveControllerImplProvider).ocrService;
  @override
  PersistenceService get persistenceService =>
      (origin as SaveControllerImplProvider).persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
