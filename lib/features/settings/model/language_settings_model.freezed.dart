// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LanguageSettingsModel {
  String get selectedLanguageCode => throw _privateConstructorUsedError;
  Map<String, String> get languages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageSettingsModelCopyWith<LanguageSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageSettingsModelCopyWith<$Res> {
  factory $LanguageSettingsModelCopyWith(LanguageSettingsModel value,
          $Res Function(LanguageSettingsModel) then) =
      _$LanguageSettingsModelCopyWithImpl<$Res, LanguageSettingsModel>;
  @useResult
  $Res call({String selectedLanguageCode, Map<String, String> languages});
}

/// @nodoc
class _$LanguageSettingsModelCopyWithImpl<$Res,
        $Val extends LanguageSettingsModel>
    implements $LanguageSettingsModelCopyWith<$Res> {
  _$LanguageSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguageCode = null,
    Object? languages = null,
  }) {
    return _then(_value.copyWith(
      selectedLanguageCode: null == selectedLanguageCode
          ? _value.selectedLanguageCode
          : selectedLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageSettingsModelImplCopyWith<$Res>
    implements $LanguageSettingsModelCopyWith<$Res> {
  factory _$$LanguageSettingsModelImplCopyWith(
          _$LanguageSettingsModelImpl value,
          $Res Function(_$LanguageSettingsModelImpl) then) =
      __$$LanguageSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String selectedLanguageCode, Map<String, String> languages});
}

/// @nodoc
class __$$LanguageSettingsModelImplCopyWithImpl<$Res>
    extends _$LanguageSettingsModelCopyWithImpl<$Res,
        _$LanguageSettingsModelImpl>
    implements _$$LanguageSettingsModelImplCopyWith<$Res> {
  __$$LanguageSettingsModelImplCopyWithImpl(_$LanguageSettingsModelImpl _value,
      $Res Function(_$LanguageSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguageCode = null,
    Object? languages = null,
  }) {
    return _then(_$LanguageSettingsModelImpl(
      selectedLanguageCode: null == selectedLanguageCode
          ? _value.selectedLanguageCode
          : selectedLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$LanguageSettingsModelImpl implements _LanguageSettingsModel {
  const _$LanguageSettingsModelImpl(
      {required this.selectedLanguageCode,
      required final Map<String, String> languages})
      : _languages = languages;

  @override
  final String selectedLanguageCode;
  final Map<String, String> _languages;
  @override
  Map<String, String> get languages {
    if (_languages is EqualUnmodifiableMapView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_languages);
  }

  @override
  String toString() {
    return 'LanguageSettingsModel(selectedLanguageCode: $selectedLanguageCode, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageSettingsModelImpl &&
            (identical(other.selectedLanguageCode, selectedLanguageCode) ||
                other.selectedLanguageCode == selectedLanguageCode) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLanguageCode,
      const DeepCollectionEquality().hash(_languages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageSettingsModelImplCopyWith<_$LanguageSettingsModelImpl>
      get copyWith => __$$LanguageSettingsModelImplCopyWithImpl<
          _$LanguageSettingsModelImpl>(this, _$identity);
}

abstract class _LanguageSettingsModel implements LanguageSettingsModel {
  const factory _LanguageSettingsModel(
          {required final String selectedLanguageCode,
          required final Map<String, String> languages}) =
      _$LanguageSettingsModelImpl;

  @override
  String get selectedLanguageCode;
  @override
  Map<String, String> get languages;
  @override
  @JsonKey(ignore: true)
  _$$LanguageSettingsModelImplCopyWith<_$LanguageSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
