// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_viewer_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pdfViewerControllerImplHash() =>
    r'190a8b4dbb8a379a14c453d6576f8977e2f203bd';

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

abstract class _$PdfViewerControllerImpl
    extends BuildlessAutoDisposeNotifier<PdfViewerModel> {
  late final PersistenceService persistenceService;
  late final NavigationService navigationService;
  late final PdfSearchService pdfSearchService;

  PdfViewerModel build({
    required PersistenceService persistenceService,
    required NavigationService navigationService,
    required PdfSearchService pdfSearchService,
  });
}

/// See also [PdfViewerControllerImpl].
@ProviderFor(PdfViewerControllerImpl)
const pdfViewerControllerImplProvider = PdfViewerControllerImplFamily();

/// See also [PdfViewerControllerImpl].
class PdfViewerControllerImplFamily extends Family<PdfViewerModel> {
  /// See also [PdfViewerControllerImpl].
  const PdfViewerControllerImplFamily();

  /// See also [PdfViewerControllerImpl].
  PdfViewerControllerImplProvider call({
    required PersistenceService persistenceService,
    required NavigationService navigationService,
    required PdfSearchService pdfSearchService,
  }) {
    return PdfViewerControllerImplProvider(
      persistenceService: persistenceService,
      navigationService: navigationService,
      pdfSearchService: pdfSearchService,
    );
  }

  @override
  PdfViewerControllerImplProvider getProviderOverride(
    covariant PdfViewerControllerImplProvider provider,
  ) {
    return call(
      persistenceService: provider.persistenceService,
      navigationService: provider.navigationService,
      pdfSearchService: provider.pdfSearchService,
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
  String? get name => r'pdfViewerControllerImplProvider';
}

/// See also [PdfViewerControllerImpl].
class PdfViewerControllerImplProvider extends AutoDisposeNotifierProviderImpl<
    PdfViewerControllerImpl, PdfViewerModel> {
  /// See also [PdfViewerControllerImpl].
  PdfViewerControllerImplProvider({
    required PersistenceService persistenceService,
    required NavigationService navigationService,
    required PdfSearchService pdfSearchService,
  }) : this._internal(
          () => PdfViewerControllerImpl()
            ..persistenceService = persistenceService
            ..navigationService = navigationService
            ..pdfSearchService = pdfSearchService,
          from: pdfViewerControllerImplProvider,
          name: r'pdfViewerControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pdfViewerControllerImplHash,
          dependencies: PdfViewerControllerImplFamily._dependencies,
          allTransitiveDependencies:
              PdfViewerControllerImplFamily._allTransitiveDependencies,
          persistenceService: persistenceService,
          navigationService: navigationService,
          pdfSearchService: pdfSearchService,
        );

  PdfViewerControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.persistenceService,
    required this.navigationService,
    required this.pdfSearchService,
  }) : super.internal();

  final PersistenceService persistenceService;
  final NavigationService navigationService;
  final PdfSearchService pdfSearchService;

  @override
  PdfViewerModel runNotifierBuild(
    covariant PdfViewerControllerImpl notifier,
  ) {
    return notifier.build(
      persistenceService: persistenceService,
      navigationService: navigationService,
      pdfSearchService: pdfSearchService,
    );
  }

  @override
  Override overrideWith(PdfViewerControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: PdfViewerControllerImplProvider._internal(
        () => create()
          ..persistenceService = persistenceService
          ..navigationService = navigationService
          ..pdfSearchService = pdfSearchService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        persistenceService: persistenceService,
        navigationService: navigationService,
        pdfSearchService: pdfSearchService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PdfViewerControllerImpl, PdfViewerModel>
      createElement() {
    return _PdfViewerControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PdfViewerControllerImplProvider &&
        other.persistenceService == persistenceService &&
        other.navigationService == navigationService &&
        other.pdfSearchService == pdfSearchService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, pdfSearchService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PdfViewerControllerImplRef
    on AutoDisposeNotifierProviderRef<PdfViewerModel> {
  /// The parameter `persistenceService` of this provider.
  PersistenceService get persistenceService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `pdfSearchService` of this provider.
  PdfSearchService get pdfSearchService;
}

class _PdfViewerControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<PdfViewerControllerImpl,
        PdfViewerModel> with PdfViewerControllerImplRef {
  _PdfViewerControllerImplProviderElement(super.provider);

  @override
  PersistenceService get persistenceService =>
      (origin as PdfViewerControllerImplProvider).persistenceService;
  @override
  NavigationService get navigationService =>
      (origin as PdfViewerControllerImplProvider).navigationService;
  @override
  PdfSearchService get pdfSearchService =>
      (origin as PdfViewerControllerImplProvider).pdfSearchService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
