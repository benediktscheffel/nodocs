// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsControllerImplHash() =>
    r'94e39b608b4eebf8d4be7347fde78ed34f739547';

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

abstract class _$SettingsControllerImpl
    extends BuildlessAutoDisposeNotifier<SettingsModel> {
  late final SettingsPersistenceService settingsPersistenceService;
  late final NavigationService navigationService;

  SettingsModel build({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  });
}

/// See also [SettingsControllerImpl].
@ProviderFor(SettingsControllerImpl)
const settingsControllerImplProvider = SettingsControllerImplFamily();

/// See also [SettingsControllerImpl].
class SettingsControllerImplFamily extends Family<SettingsModel> {
  /// See also [SettingsControllerImpl].
  const SettingsControllerImplFamily();

  /// See also [SettingsControllerImpl].
  SettingsControllerImplProvider call({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  }) {
    return SettingsControllerImplProvider(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  SettingsControllerImplProvider getProviderOverride(
    covariant SettingsControllerImplProvider provider,
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
  String? get name => r'settingsControllerImplProvider';
}

/// See also [SettingsControllerImpl].
class SettingsControllerImplProvider extends AutoDisposeNotifierProviderImpl<
    SettingsControllerImpl, SettingsModel> {
  /// See also [SettingsControllerImpl].
  SettingsControllerImplProvider({
    required SettingsPersistenceService settingsPersistenceService,
    required NavigationService navigationService,
  }) : this._internal(
          () => SettingsControllerImpl()
            ..settingsPersistenceService = settingsPersistenceService
            ..navigationService = navigationService,
          from: settingsControllerImplProvider,
          name: r'settingsControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settingsControllerImplHash,
          dependencies: SettingsControllerImplFamily._dependencies,
          allTransitiveDependencies:
              SettingsControllerImplFamily._allTransitiveDependencies,
          settingsPersistenceService: settingsPersistenceService,
          navigationService: navigationService,
        );

  SettingsControllerImplProvider._internal(
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
  SettingsModel runNotifierBuild(
    covariant SettingsControllerImpl notifier,
  ) {
    return notifier.build(
      settingsPersistenceService: settingsPersistenceService,
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(SettingsControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: SettingsControllerImplProvider._internal(
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
  AutoDisposeNotifierProviderElement<SettingsControllerImpl, SettingsModel>
      createElement() {
    return _SettingsControllerImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SettingsControllerImplProvider &&
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

mixin SettingsControllerImplRef
    on AutoDisposeNotifierProviderRef<SettingsModel> {
  /// The parameter `settingsPersistenceService` of this provider.
  SettingsPersistenceService get settingsPersistenceService;

  /// The parameter `navigationService` of this provider.
  NavigationService get navigationService;
}

class _SettingsControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<SettingsControllerImpl,
        SettingsModel> with SettingsControllerImplRef {
  _SettingsControllerImplProviderElement(super.provider);

  @override
  SettingsPersistenceService get settingsPersistenceService =>
      (origin as SettingsControllerImplProvider).settingsPersistenceService;
  @override
  NavigationService get navigationService =>
      (origin as SettingsControllerImplProvider).navigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
