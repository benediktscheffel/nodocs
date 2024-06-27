// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsControllerImplHash() =>
    r'43c35f56106edd226992c16c06f556bf4d47f4f5';

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
  late final bool darkMode;

  SettingsModel build(
    bool darkMode,
  );
}

/// See also [SettingsControllerImpl].
@ProviderFor(SettingsControllerImpl)
const settingsControllerImplProvider = SettingsControllerImplFamily();

/// See also [SettingsControllerImpl].
class SettingsControllerImplFamily extends Family<SettingsModel> {
  /// See also [SettingsControllerImpl].
  const SettingsControllerImplFamily();

  /// See also [SettingsControllerImpl].
  SettingsControllerImplProvider call(
    bool darkMode,
  ) {
    return SettingsControllerImplProvider(
      darkMode,
    );
  }

  @override
  SettingsControllerImplProvider getProviderOverride(
    covariant SettingsControllerImplProvider provider,
  ) {
    return call(
      provider.darkMode,
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
  SettingsControllerImplProvider(
    bool darkMode,
  ) : this._internal(
          () => SettingsControllerImpl()..darkMode = darkMode,
          from: settingsControllerImplProvider,
          name: r'settingsControllerImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settingsControllerImplHash,
          dependencies: SettingsControllerImplFamily._dependencies,
          allTransitiveDependencies:
              SettingsControllerImplFamily._allTransitiveDependencies,
          darkMode: darkMode,
        );

  SettingsControllerImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.darkMode,
  }) : super.internal();

  final bool darkMode;

  @override
  SettingsModel runNotifierBuild(
    covariant SettingsControllerImpl notifier,
  ) {
    return notifier.build(
      darkMode,
    );
  }

  @override
  Override overrideWith(SettingsControllerImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: SettingsControllerImplProvider._internal(
        () => create()..darkMode = darkMode,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        darkMode: darkMode,
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
        other.darkMode == darkMode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, darkMode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SettingsControllerImplRef
    on AutoDisposeNotifierProviderRef<SettingsModel> {
  /// The parameter `darkMode` of this provider.
  bool get darkMode;
}

class _SettingsControllerImplProviderElement
    extends AutoDisposeNotifierProviderElement<SettingsControllerImpl,
        SettingsModel> with SettingsControllerImplRef {
  _SettingsControllerImplProviderElement(super.provider);

  @override
  bool get darkMode => (origin as SettingsControllerImplProvider).darkMode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
