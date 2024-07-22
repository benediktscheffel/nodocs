// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_settings_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$languageSettingsControllerImplHash() =>
    r'320b38388e0927da2ac406f753e18576ffd39c89';

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

abstract class _$LanguageSettingsControllerImpl
    extends BuildlessAutoDisposeNotifier<LanguageSettingsModel> {
  late final SettingsPersistenceService settingsPersistenceService;
  late final NavigationService navigationService;
  late final LanguageEvaluationService languageEvaluationService;

  LanguageSettingsModel build({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
    required LanguageEvaluationService languageEvaluationService,
  });
}

/// See also [LanguageSettingsControllerImpl].
@ProviderFor(LanguageSettingsControllerImpl)
const languageSettingsControllerImplProvider =
    LanguageSettingsControllerImplFamily();

/// See also [LanguageSettingsControllerImpl].
class LanguageSettingsControllerImplFamily
    extends Family<LanguageSettingsModel> {
  /// See also [LanguageSettingsControllerImpl].
  const LanguageSettingsControllerImplFamily();

  /// See also [LanguageSettingsControllerImpl].
  LanguageSettingsControllerImplProvider call({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
    required LanguageEvaluationService languageEvaluationService,
  }) {
    return LanguageSettingsControllerImplProvider(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
      languageEvaluationService: languageEvaluationService,
    );
  }

  @override
  LanguageSettingsControllerImplProvider getProviderOverride(
    covariant LanguageSettingsControllerImplProvider provider,
  ) {
    return call(
      settingsPersistenceService: provider.settingsPersistenceService,
      navigationService: provider.navigationService,
      languageEvaluationService: provider.languageEvaluationService,
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
  String? get name => r'languageSettingsControllerImplProvider';
}

/// See also [LanguageSettingsControllerImpl].
class LanguageSettingsControllerImplProvider
    extends AutoDisposeNotifierProviderImpl<LanguageSettingsControllerImpl,
        LanguageSettingsModel> {
  /// See also [LanguageSettingsControllerImpl].
  LanguageSettingsControllerImplProvider({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
    required LanguageEvaluationService languageEvaluationService,
  }) : this._internal(
          () => LanguageSettingsControllerImpl()
            ..settingsPersistenceService = settingsPersistenceService
            ..navigationService = navigationService
            ..languageEvaluationService = languageEvaluationService,
          from: languageSettingsControllerImplProvider,
          name: r'languageSettingsControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$languageSettingsControllerImplHash,
          dependencies: LanguageSettingsControllerImplFamily._dependencies,
          allTransitiveDependencies:
              LanguageSettingsControllerImplFamily._allTransitiveDependencies,
          settingsPersistenceService: settingsPersistenceService,
          navigationService: navigationService,
          languageEvaluationService: languageEvaluationService,
        );

  LanguageSettingsControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.settingsPersistenceService,
    required this.navigationService,
    required this.languageEvaluationService,
  }) : super.internal();

  final SettingsPersistenceService settingsPersistenceService;
  final NavigationService navigationService;
  final LanguageEvaluationService languageEvaluationService;

  @override
  LanguageSettingsModel runNotifierBuild(
    covariant LanguageSettingsControllerImpl notifier,
  ) {
    return notifier.build(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
      languageEvaluationService: languageEvaluationService,
    );
  }

  @override
  Override overrideWith(LanguageSettingsControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: LanguageSettingsControllerImplProvider._internal(
        () => create()
          ..settingsPersistenceService = settingsPersistenceService
          ..navigationService = navigationService
          ..languageEvaluationService = languageEvaluationService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        settingsPersistenceService: settingsPersistenceService,
        navigationService: navigationService,
        languageEvaluationService: languageEvaluationService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LanguageSettingsControllerImpl,
      LanguageSettingsModel> createElement() {
    return _LanguageSettingsControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LanguageSettingsControllerImplProvider &&
        other.settingsPersistenceService == settingsPersistenceService &&
        other.navigationService == navigationService &&
        other.languageEvaluationService == languageEvaluationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, settingsPersistenceService.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, languageEvaluationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LanguageSettingsControllerImplRef
    on AutoDisposeNotifierProviderRef<LanguageSettingsModel> {
  /// The parameter `settingsPersistenceService` of this provider.
  SettingsPersistenceService get settingsPersistenceService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;

  /// The parameter `languageEvaluationService` of this provider.
  LanguageEvaluationService get languageEvaluationService;
}

class _LanguageSettingsControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<LanguageSettingsControllerImpl,
        LanguageSettingsModel> with LanguageSettingsControllerImplRef {
  _LanguageSettingsControllerImplProviderElement(super.provider);

  @override
  SettingsPersistenceService get settingsPersistenceService =>
      (origin as LanguageSettingsControllerImplProvider)
          .settingsPersistenceService;
  @override
  NavigationService get navigationService =>
      (origin as LanguageSettingsControllerImplProvider).navigationService;
  @override
  LanguageEvaluationService get languageEvaluationService =>
      (origin as LanguageSettingsControllerImplProvider)
          .languageEvaluationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
