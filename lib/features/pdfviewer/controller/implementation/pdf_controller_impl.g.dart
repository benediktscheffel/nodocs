// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pdfControllerImplHash() => r'20954d84a512f9f217b6e248d5b9a1d6bf7dce71';

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

  PdfViewerModel build({
    required TagPersistenceService tagPersistenceService,
    required NavigationService navigationService,
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
  }) {
    return PdfControllerImplProvider(
      tagPersistenceService: tagPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  PdfControllerImplProvider getProviderOverride(
    covariant PdfControllerImplProvider provider,
  ) {
    return call(
      tagPersistenceService: provider.tagPersistenceService,
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
  String? get name => r'pdfControllerImplProvider';
}

/// See also [PdfControllerImpl].
class PdfControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<PdfControllerImpl, PdfViewerModel> {
  /// See also [PdfControllerImpl].
  PdfControllerImplProvider({
    required TagPersistenceService tagPersistenceService,
    required NavigationService navigationService,
  }) : this._internal(
          () => PdfControllerImpl()
            ..tagPersistenceService = tagPersistenceService
            ..navigationService = navigationService,
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
  }) : super.internal();

  final TagPersistenceService tagPersistenceService;
  final NavigationService navigationService;

  @override
  PdfViewerModel runNotifierBuild(
    covariant PdfControllerImpl notifier,
  ) {
    return notifier.build(
      tagPersistenceService: tagPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(PdfControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: PdfControllerImplProvider._internal(
        () => create()
          ..tagPersistenceService = tagPersistenceService
          ..navigationService = navigationService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tagPersistenceService: tagPersistenceService,
        navigationService: navigationService,
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
        other.navigationService == navigationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tagPersistenceService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PdfControllerImplRef on AutoDisposeNotifierProviderRef<PdfViewerModel> {
  /// The parameter `tagPersistenceService` of this provider.
  TagPersistenceService get tagPersistenceService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;
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
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
