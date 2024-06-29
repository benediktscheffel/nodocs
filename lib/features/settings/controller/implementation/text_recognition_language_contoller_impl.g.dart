// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_recognition_language_contoller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textRecognitionLanguageContollerImplHash() =>
    r'b89397580ba61c5e741d30c134666bdf9464f710';

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

abstract class _$TextRecognitionLanguageContollerImpl
    extends BuildlessAutoDisposeNotifier<TextRecognitionLanguageModel> {
  late final SettingsPersistenceService settingsPersistenceService;
  late final NavigationService navigationService;

  TextRecognitionLanguageModel build({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  });
}

/// See also [TextRecognitionLanguageContollerImpl].
@ProviderFor(TextRecognitionLanguageContollerImpl)
const textRecognitionLanguageContollerImplProvider =
    TextRecognitionLanguageContollerImplFamily();

/// See also [TextRecognitionLanguageContollerImpl].
class TextRecognitionLanguageContollerImplFamily
    extends Family<TextRecognitionLanguageModel> {
  /// See also [TextRecognitionLanguageContollerImpl].
  const TextRecognitionLanguageContollerImplFamily();

  /// See also [TextRecognitionLanguageContollerImpl].
  TextRecognitionLanguageContollerImplProvider call({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  }) {
    return TextRecognitionLanguageContollerImplProvider(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  TextRecognitionLanguageContollerImplProvider getProviderOverride(
    covariant TextRecognitionLanguageContollerImplProvider provider,
  ) {
    return call(
      settingsPersistenceService: provider.settingsPersistenceService,
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
  String? get name => r'textRecognitionLanguageContollerImplProvider';
}

/// See also [TextRecognitionLanguageContollerImpl].
class TextRecognitionLanguageContollerImplProvider
    extends AutoDisposeNotifierProviderImpl<
        TextRecognitionLanguageContollerImpl, TextRecognitionLanguageModel> {
  /// See also [TextRecognitionLanguageContollerImpl].
  TextRecognitionLanguageContollerImplProvider({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  }) : this._internal(
          () => TextRecognitionLanguageContollerImpl()
            ..settingsPersistenceService = settingsPersistenceService
            ..navigationService = navigationService,
          from: textRecognitionLanguageContollerImplProvider,
          name: r'textRecognitionLanguageContollerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textRecognitionLanguageContollerImplHash,
          dependencies:
              TextRecognitionLanguageContollerImplFamily._dependencies,
          allTransitiveDependencies: TextRecognitionLanguageContollerImplFamily
              ._allTransitiveDependencies,
          settingsPersistenceService: settingsPersistenceService,
          navigationService: navigationService,
        );

  TextRecognitionLanguageContollerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.settingsPersistenceService,
    required this.navigationService,
  }) : super.internal();

  final SettingsPersistenceService settingsPersistenceService;
  final NavigationService navigationService;

  @override
  TextRecognitionLanguageModel runNotifierBuild(
    covariant TextRecognitionLanguageContollerImpl notifier,
  ) {
    return notifier.build(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(
      TextRecognitionLanguageContollerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: TextRecognitionLanguageContollerImplProvider._internal(
        () => create()
          ..settingsPersistenceService = settingsPersistenceService
          ..navigationService = navigationService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        settingsPersistenceService: settingsPersistenceService,
        navigationService: navigationService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TextRecognitionLanguageContollerImpl,
      TextRecognitionLanguageModel> createElement() {
    return _TextRecognitionLanguageContollerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextRecognitionLanguageContollerImplProvider &&
        other.settingsPersistenceService == settingsPersistenceService &&
        other.navigationService == navigationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, settingsPersistenceService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TextRecognitionLanguageContollerImplRef
    on AutoDisposeNotifierProviderRef<TextRecognitionLanguageModel> {
  /// The parameter `settingsPersistenceService` of this provider.
  SettingsPersistenceService get settingsPersistenceService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;
}

class _TextRecognitionLanguageContollerImplProviderElement
    extends AutoDisposeNotifierProviderElement<
        TextRecognitionLanguageContollerImpl, TextRecognitionLanguageModel>
    with TextRecognitionLanguageContollerImplRef {
  _TextRecognitionLanguageContollerImplProviderElement(super.provider);

  @override
  SettingsPersistenceService get settingsPersistenceService =>
      (origin as TextRecognitionLanguageContollerImplProvider)
          .settingsPersistenceService;
  @override
  NavigationService get navigationService =>
      (origin as TextRecognitionLanguageContollerImplProvider)
          .navigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
