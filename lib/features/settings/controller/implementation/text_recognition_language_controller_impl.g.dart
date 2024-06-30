// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_recognition_language_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textRecognitionLanguageControllerImplHash() =>
    r'59ace54e4ae419c0b756cab0b27a9a94a9bdb2a5';

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

abstract class _$TextRecognitionLanguageControllerImpl
    extends BuildlessAutoDisposeNotifier<TextRecognitionLanguageModel> {
  late final SettingsPersistenceService settingsPersistenceService;
  late final NavigationService navigationService;

  TextRecognitionLanguageModel build({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  });
}

/// See also [TextRecognitionLanguageControllerImpl].
@ProviderFor(TextRecognitionLanguageControllerImpl)
const textRecognitionLanguageControllerImplProvider =
    TextRecognitionLanguageControllerImplFamily();

/// See also [TextRecognitionLanguageControllerImpl].
class TextRecognitionLanguageControllerImplFamily
    extends Family<TextRecognitionLanguageModel> {
  /// See also [TextRecognitionLanguageControllerImpl].
  const TextRecognitionLanguageControllerImplFamily();

  /// See also [TextRecognitionLanguageControllerImpl].
  TextRecognitionLanguageControllerImplProvider call({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  }) {
    return TextRecognitionLanguageControllerImplProvider(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  TextRecognitionLanguageControllerImplProvider getProviderOverride(
    covariant TextRecognitionLanguageControllerImplProvider provider,
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
  String? get name => r'textRecognitionLanguageControllerImplProvider';
}

/// See also [TextRecognitionLanguageControllerImpl].
class TextRecognitionLanguageControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<
        TextRecognitionLanguageControllerImpl, TextRecognitionLanguageModel> {
  /// See also [TextRecognitionLanguageControllerImpl].
  TextRecognitionLanguageControllerImplProvider({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  }) : this._internal(
          () => TextRecognitionLanguageControllerImpl()
            ..settingsPersistenceService = settingsPersistenceService
            ..navigationService = navigationService,
          from: textRecognitionLanguageControllerImplProvider,
          name: r'textRecognitionLanguageControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textRecognitionLanguageControllerImplHash,
          dependencies:
              TextRecognitionLanguageControllerImplFamily._dependencies,
          allTransitiveDependencies: TextRecognitionLanguageControllerImplFamily
              ._allTransitiveDependencies,
          settingsPersistenceService: settingsPersistenceService,
          navigationService: navigationService,
        );

  TextRecognitionLanguageControllerImplProvider._internal(
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
    covariant TextRecognitionLanguageControllerImpl notifier,
  ) {
    return notifier.build(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(
      TextRecognitionLanguageControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: TextRecognitionLanguageControllerImplProvider._internal(
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
  AutoDisposeNotifierProviderElement<TextRecognitionLanguageControllerImpl,
      TextRecognitionLanguageModel> createElement() {
    return _TextRecognitionLanguageControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextRecognitionLanguageControllerImplProvider &&
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

mixin TextRecognitionLanguageControllerImplRef
    on AutoDisposeNotifierProviderRef<TextRecognitionLanguageModel> {
  /// The parameter `settingsPersistenceService` of this provider.
  SettingsPersistenceService get settingsPersistenceService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;
}

class _TextRecognitionLanguageControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<
        TextRecognitionLanguageControllerImpl, TextRecognitionLanguageModel>
    with TextRecognitionLanguageControllerImplRef {
  _TextRecognitionLanguageControllerImplProviderElement(super.provider);

  @override
  SettingsPersistenceService get settingsPersistenceService =>
      (origin as TextRecognitionLanguageControllerImplProvider)
          .settingsPersistenceService;
  @override
  NavigationService get navigationService =>
      (origin as TextRecognitionLanguageControllerImplProvider)
          .navigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
