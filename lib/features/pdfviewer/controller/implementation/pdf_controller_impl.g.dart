// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pdfControllerImplHash() => r'7934cd87009ea68a9d33dc76e4772b5af9bd1f80';

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

abstract class _$PdfControllerImpl
    extends BuildlessAutoDisposeNotifier<PdfViewerModel> {
  late final TagPersistenceService tagPersistenceService;
  late final NavigationService navigationService;
  late final PdfSearchService pdfSearchService;

  PdfViewerModel build({
    required TagPersistenceService tagPersistenceService,
    required NavigationService navigationService,
    required PdfSearchService pdfSearchService,
  });
}

/// See also [PdfControllerImpl].
@ProviderFor(PdfControllerImpl)
const pdfControllerImplProvider = PdfControllerImplFamily();

/// See also [PdfControllerImpl].
class PdfControllerImplFamily extends Family<PdfViewerModel> {
  /// See also [PdfControllerImpl].
  const PdfControllerImplFamily();

  /// See also [PdfControllerImpl].
  PdfControllerImplProvider call({
    required TagPersistenceService tagPersistenceService,
    required NavigationService navigationService,
    required PdfSearchService pdfSearchService,
  }) {
    return PdfControllerImplProvider(
      tagPersistenceService: tagPersistenceService,
      navigationService: navigationService,
      pdfSearchService: pdfSearchService,
    );
  }

  @override
  PdfControllerImplProvider getProviderOverride(
    covariant PdfControllerImplProvider provider,
  ) {
    return call(
      tagPersistenceService: provider.tagPersistenceService,
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
  String? get name => r'pdfControllerImplProvider';
}

/// See also [PdfControllerImpl].
class PdfControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<PdfControllerImpl, PdfViewerModel> {
  /// See also [PdfControllerImpl].
  PdfControllerImplProvider({
    required TagPersistenceService tagPersistenceService,
    required NavigationService navigationService,
    required PdfSearchService pdfSearchService,
  }) : this._internal(
          () => PdfControllerImpl()
            ..tagPersistenceService = tagPersistenceService
            ..navigationService = navigationService
            ..pdfSearchService = pdfSearchService,
          from: pdfControllerImplProvider,
          name: r'pdfControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pdfControllerImplHash,
          dependencies: PdfControllerImplFamily._dependencies,
          allTransitiveDependencies:
              PdfControllerImplFamily._allTransitiveDependencies,
          tagPersistenceService: tagPersistenceService,
          navigationService: navigationService,
          pdfSearchService: pdfSearchService,
        );

  PdfControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tagPersistenceService,
    required this.navigationService,
    required this.pdfSearchService,
  }) : super.internal();

  final TagPersistenceService tagPersistenceService;
  final NavigationService navigationService;
  final PdfSearchService pdfSearchService;

  @override
  PdfViewerModel runNotifierBuild(
    covariant PdfControllerImpl notifier,
  ) {
    return notifier.build(
      tagPersistenceService: tagPersistenceService,
      navigationService: navigationService,
      pdfSearchService: pdfSearchService,
    );
  }

  @override
  Override overrideWith(PdfControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: PdfControllerImplProvider._internal(
        () => create()
          ..tagPersistenceService = tagPersistenceService
          ..navigationService = navigationService
          ..pdfSearchService = pdfSearchService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tagPersistenceService: tagPersistenceService,
        navigationService: navigationService,
        pdfSearchService: pdfSearchService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PdfControllerImpl, PdfViewerModel>
      createElement() {
    return _PdfControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PdfControllerImplProvider &&
        other.tagPersistenceService == tagPersistenceService &&
        other.navigationService == navigationService &&
        other.pdfSearchService == pdfSearchService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tagPersistenceService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, pdfSearchService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PdfControllerImplRef on AutoDisposeNotifierProviderRef<PdfViewerModel> {
  /// The parameter `tagPersistenceService` of this provider.
  TagPersistenceService get tagPersistenceService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `pdfSearchService` of this provider.
  PdfSearchService get pdfSearchService;
}

class _PdfControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<PdfControllerImpl,
        PdfViewerModel> with PdfControllerImplRef {
  _PdfControllerImplProviderElement(super.provider);

  @override
  TagPersistenceService get tagPersistenceService =>
      (origin as PdfControllerImplProvider).tagPersistenceService;
  @override
  NavigationService get navigationService =>
      (origin as PdfControllerImplProvider).navigationService;
  @override
  PdfSearchService get pdfSearchService =>
      (origin as PdfControllerImplProvider).pdfSearchService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
