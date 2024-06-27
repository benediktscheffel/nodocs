// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CropModel {
  List<String> get imagePaths => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CropModelCopyWith<CropModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropModelCopyWith<$Res> {
  factory $CropModelCopyWith(CropModel value, $Res Function(CropModel) then) =
      _$CropModelCopyWithImpl<$Res, CropModel>;
  @useResult
  $Res call({List<String> imagePaths});
}

/// @nodoc
class _$CropModelCopyWithImpl<$Res, $Val extends CropModel>
    implements $CropModelCopyWith<$Res> {
  _$CropModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePaths = null,
  }) {
    return _then(_value.copyWith(
      imagePaths: null == imagePaths
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CropModelImplCopyWith<$Res>
    implements $CropModelCopyWith<$Res> {
  factory _$$CropModelImplCopyWith(
          _$CropModelImpl value, $Res Function(_$CropModelImpl) then) =
      __$$CropModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> imagePaths});
}

/// @nodoc
class __$$CropModelImplCopyWithImpl<$Res>
    extends _$CropModelCopyWithImpl<$Res, _$CropModelImpl>
    implements _$$CropModelImplCopyWith<$Res> {
  __$$CropModelImplCopyWithImpl(
      _$CropModelImpl _value, $Res Function(_$CropModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePaths = null,
  }) {
    return _then(_$CropModelImpl(
      imagePaths: null == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CropModelImpl implements _CropModel {
  const _$CropModelImpl({required final List<String> imagePaths})
      : _imagePaths = imagePaths;

  final List<String> _imagePaths;
  @override
  List<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePaths);
  }

  @override
  String toString() {
    return 'CropModel(imagePaths: $imagePaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropModelImpl &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_imagePaths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CropModelImplCopyWith<_$CropModelImpl> get copyWith =>
      __$$CropModelImplCopyWithImpl<_$CropModelImpl>(this, _$identity);
}

abstract class _CropModel implements CropModel {
  const factory _CropModel({required final List<String> imagePaths}) =
      _$CropModelImpl;

  @override
  List<String> get imagePaths;
  @override
  @JsonKey(ignore: true)
  _$$CropModelImplCopyWith<_$CropModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
