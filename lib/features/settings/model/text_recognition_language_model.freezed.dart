// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_recognition_language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextRecognitionLanguageModel {
  String get selectedLanguageCode => throw _privateConstructorUsedError;
  Map<String, String> get languages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextRecognitionLanguageModelCopyWith<TextRecognitionLanguageModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextRecognitionLanguageModelCopyWith<$Res> {
  factory $TextRecognitionLanguageModelCopyWith(
          TextRecognitionLanguageModel value,
          $Res Function(TextRecognitionLanguageModel) then) =
      _$TextRecognitionLanguageModelCopyWithImpl<$Res,
          TextRecognitionLanguageModel>;
  @useResult
  $Res call({String selectedLanguageCode, Map<String, String> languages});
}

/// @nodoc
class _$TextRecognitionLanguageModelCopyWithImpl<$Res,
        $Val extends TextRecognitionLanguageModel>
    implements $TextRecognitionLanguageModelCopyWith<$Res> {
  _$TextRecognitionLanguageModelCopyWithImpl(this._value, this._then);

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
abstract class _$$TextRecognitionLanguageModelImplCopyWith<$Res>
    implements $TextRecognitionLanguageModelCopyWith<$Res> {
  factory _$$TextRecognitionLanguageModelImplCopyWith(
          _$TextRecognitionLanguageModelImpl value,
          $Res Function(_$TextRecognitionLanguageModelImpl) then) =
      __$$TextRecognitionLanguageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String selectedLanguageCode, Map<String, String> languages});
}

/// @nodoc
class __$$TextRecognitionLanguageModelImplCopyWithImpl<$Res>
    extends _$TextRecognitionLanguageModelCopyWithImpl<$Res,
        _$TextRecognitionLanguageModelImpl>
    implements _$$TextRecognitionLanguageModelImplCopyWith<$Res> {
  __$$TextRecognitionLanguageModelImplCopyWithImpl(
      _$TextRecognitionLanguageModelImpl _value,
      $Res Function(_$TextRecognitionLanguageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguageCode = null,
    Object? languages = null,
  }) {
    return _then(_$TextRecognitionLanguageModelImpl(
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

class _$TextRecognitionLanguageModelImpl
    implements _TextRecognitionLanguageModel {
  const _$TextRecognitionLanguageModelImpl(
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
    return 'TextRecognitionLanguageModel(selectedLanguageCode: $selectedLanguageCode, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextRecognitionLanguageModelImpl &&
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
  _$$TextRecognitionLanguageModelImplCopyWith<
          _$TextRecognitionLanguageModelImpl>
      get copyWith => __$$TextRecognitionLanguageModelImplCopyWithImpl<
          _$TextRecognitionLanguageModelImpl>(this, _$identity);
}

abstract class _TextRecognitionLanguageModel
    implements TextRecognitionLanguageModel {
  const factory _TextRecognitionLanguageModel(
          {required final String selectedLanguageCode,
          required final Map<String, String> languages}) =
      _$TextRecognitionLanguageModelImpl;

  @override
  String get selectedLanguageCode;
  @override
  Map<String, String> get languages;
  @override
  @JsonKey(ignore: true)
  _$$TextRecognitionLanguageModelImplCopyWith<
          _$TextRecognitionLanguageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
