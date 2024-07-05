// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchResultModel {
  Map<String, List<String>> get tagResults =>
      throw _privateConstructorUsedError;
  List<String> get fileResults => throw _privateConstructorUsedError;
  Map<String, int> get textResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResultModelCopyWith<SearchResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultModelCopyWith<$Res> {
  factory $SearchResultModelCopyWith(
          SearchResultModel value, $Res Function(SearchResultModel) then) =
      _$SearchResultModelCopyWithImpl<$Res, SearchResultModel>;
  @useResult
  $Res call(
      {Map<String, List<String>> tagResults,
      List<String> fileResults,
      Map<String, int> textResults});
}

/// @nodoc
class _$SearchResultModelCopyWithImpl<$Res, $Val extends SearchResultModel>
    implements $SearchResultModelCopyWith<$Res> {
  _$SearchResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagResults = null,
    Object? fileResults = null,
    Object? textResults = null,
  }) {
    return _then(_value.copyWith(
      tagResults: null == tagResults
          ? _value.tagResults
          : tagResults // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      fileResults: null == fileResults
          ? _value.fileResults
          : fileResults // ignore: cast_nullable_to_non_nullable
              as List<String>,
      textResults: null == textResults
          ? _value.textResults
          : textResults // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultModelImplCopyWith<$Res>
    implements $SearchResultModelCopyWith<$Res> {
  factory _$$SearchResultModelImplCopyWith(_$SearchResultModelImpl value,
          $Res Function(_$SearchResultModelImpl) then) =
      __$$SearchResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<String>> tagResults,
      List<String> fileResults,
      Map<String, int> textResults});
}

/// @nodoc
class __$$SearchResultModelImplCopyWithImpl<$Res>
    extends _$SearchResultModelCopyWithImpl<$Res, _$SearchResultModelImpl>
    implements _$$SearchResultModelImplCopyWith<$Res> {
  __$$SearchResultModelImplCopyWithImpl(_$SearchResultModelImpl _value,
      $Res Function(_$SearchResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagResults = null,
    Object? fileResults = null,
    Object? textResults = null,
  }) {
    return _then(_$SearchResultModelImpl(
      tagResults: null == tagResults
          ? _value._tagResults
          : tagResults // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      fileResults: null == fileResults
          ? _value._fileResults
          : fileResults // ignore: cast_nullable_to_non_nullable
              as List<String>,
      textResults: null == textResults
          ? _value._textResults
          : textResults // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$SearchResultModelImpl implements _SearchResultModel {
  const _$SearchResultModelImpl(
      {required final Map<String, List<String>> tagResults,
      required final List<String> fileResults,
      required final Map<String, int> textResults})
      : _tagResults = tagResults,
        _fileResults = fileResults,
        _textResults = textResults;

  final Map<String, List<String>> _tagResults;
  @override
  Map<String, List<String>> get tagResults {
    if (_tagResults is EqualUnmodifiableMapView) return _tagResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tagResults);
  }

  final List<String> _fileResults;
  @override
  List<String> get fileResults {
    if (_fileResults is EqualUnmodifiableListView) return _fileResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fileResults);
  }

  final Map<String, int> _textResults;
  @override
  Map<String, int> get textResults {
    if (_textResults is EqualUnmodifiableMapView) return _textResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_textResults);
  }

  @override
  String toString() {
    return 'SearchResultModel(tagResults: $tagResults, fileResults: $fileResults, textResults: $textResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultModelImpl &&
            const DeepCollectionEquality()
                .equals(other._tagResults, _tagResults) &&
            const DeepCollectionEquality()
                .equals(other._fileResults, _fileResults) &&
            const DeepCollectionEquality()
                .equals(other._textResults, _textResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tagResults),
      const DeepCollectionEquality().hash(_fileResults),
      const DeepCollectionEquality().hash(_textResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultModelImplCopyWith<_$SearchResultModelImpl> get copyWith =>
      __$$SearchResultModelImplCopyWithImpl<_$SearchResultModelImpl>(
          this, _$identity);
}

abstract class _SearchResultModel implements SearchResultModel {
  const factory _SearchResultModel(
      {required final Map<String, List<String>> tagResults,
      required final List<String> fileResults,
      required final Map<String, int> textResults}) = _$SearchResultModelImpl;

  @override
  Map<String, List<String>> get tagResults;
  @override
  List<String> get fileResults;
  @override
  Map<String, int> get textResults;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultModelImplCopyWith<_$SearchResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
