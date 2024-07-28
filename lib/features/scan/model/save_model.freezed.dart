// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaveModel {
  Map<String, bool> get tags => throw _privateConstructorUsedError;
  int get currentSliderIndex => throw _privateConstructorUsedError;
  List<String> get imagePaths => throw _privateConstructorUsedError;
  bool get toggleCamera => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get savePath => throw _privateConstructorUsedError;
  CollectionDropdownModel get collectionDropdownModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaveModelCopyWith<SaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveModelCopyWith<$Res> {
  factory $SaveModelCopyWith(SaveModel value, $Res Function(SaveModel) then) =
      _$SaveModelCopyWithImpl<$Res, SaveModel>;
  @useResult
  $Res call(
      {Map<String, bool> tags,
      int currentSliderIndex,
      List<String> imagePaths,
      bool toggleCamera,
      String title,
      String savePath,
      CollectionDropdownModel collectionDropdownModel});
}

/// @nodoc
class _$SaveModelCopyWithImpl<$Res, $Val extends SaveModel>
    implements $SaveModelCopyWith<$Res> {
  _$SaveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? currentSliderIndex = null,
    Object? imagePaths = null,
    Object? toggleCamera = null,
    Object? title = null,
    Object? savePath = null,
    Object? collectionDropdownModel = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      currentSliderIndex: null == currentSliderIndex
          ? _value.currentSliderIndex
          : currentSliderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      imagePaths: null == imagePaths
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      toggleCamera: null == toggleCamera
          ? _value.toggleCamera
          : toggleCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      savePath: null == savePath
          ? _value.savePath
          : savePath // ignore: cast_nullable_to_non_nullable
              as String,
      collectionDropdownModel: null == collectionDropdownModel
          ? _value.collectionDropdownModel
          : collectionDropdownModel // ignore: cast_nullable_to_non_nullable
              as CollectionDropdownModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveModelImplCopyWith<$Res>
    implements $SaveModelCopyWith<$Res> {
  factory _$$SaveModelImplCopyWith(
          _$SaveModelImpl value, $Res Function(_$SaveModelImpl) then) =
      __$$SaveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, bool> tags,
      int currentSliderIndex,
      List<String> imagePaths,
      bool toggleCamera,
      String title,
      String savePath,
      CollectionDropdownModel collectionDropdownModel});
}

/// @nodoc
class __$$SaveModelImplCopyWithImpl<$Res>
    extends _$SaveModelCopyWithImpl<$Res, _$SaveModelImpl>
    implements _$$SaveModelImplCopyWith<$Res> {
  __$$SaveModelImplCopyWithImpl(
      _$SaveModelImpl _value, $Res Function(_$SaveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? currentSliderIndex = null,
    Object? imagePaths = null,
    Object? toggleCamera = null,
    Object? title = null,
    Object? savePath = null,
    Object? collectionDropdownModel = null,
  }) {
    return _then(_$SaveModelImpl(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      currentSliderIndex: null == currentSliderIndex
          ? _value.currentSliderIndex
          : currentSliderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      imagePaths: null == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      toggleCamera: null == toggleCamera
          ? _value.toggleCamera
          : toggleCamera // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      savePath: null == savePath
          ? _value.savePath
          : savePath // ignore: cast_nullable_to_non_nullable
              as String,
      collectionDropdownModel: null == collectionDropdownModel
          ? _value.collectionDropdownModel
          : collectionDropdownModel // ignore: cast_nullable_to_non_nullable
              as CollectionDropdownModel,
    ));
  }
}

/// @nodoc

class _$SaveModelImpl implements _SaveModel {
  const _$SaveModelImpl(
      {required final Map<String, bool> tags,
      required this.currentSliderIndex,
      required final List<String> imagePaths,
      required this.toggleCamera,
      required this.title,
      required this.savePath,
      required this.collectionDropdownModel})
      : _tags = tags,
        _imagePaths = imagePaths;

  final Map<String, bool> _tags;
  @override
  Map<String, bool> get tags {
    if (_tags is EqualUnmodifiableMapView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tags);
  }

  @override
  final int currentSliderIndex;
  final List<String> _imagePaths;
  @override
  List<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePaths);
  }

  @override
  final bool toggleCamera;
  @override
  final String title;
  @override
  final String savePath;
  @override
  final CollectionDropdownModel collectionDropdownModel;

  @override
  String toString() {
    return 'SaveModel(tags: $tags, currentSliderIndex: $currentSliderIndex, imagePaths: $imagePaths, toggleCamera: $toggleCamera, title: $title, savePath: $savePath, collectionDropdownModel: $collectionDropdownModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveModelImpl &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.currentSliderIndex, currentSliderIndex) ||
                other.currentSliderIndex == currentSliderIndex) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths) &&
            (identical(other.toggleCamera, toggleCamera) ||
                other.toggleCamera == toggleCamera) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.savePath, savePath) ||
                other.savePath == savePath) &&
            (identical(
                    other.collectionDropdownModel, collectionDropdownModel) ||
                other.collectionDropdownModel == collectionDropdownModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tags),
      currentSliderIndex,
      const DeepCollectionEquality().hash(_imagePaths),
      toggleCamera,
      title,
      savePath,
      collectionDropdownModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveModelImplCopyWith<_$SaveModelImpl> get copyWith =>
      __$$SaveModelImplCopyWithImpl<_$SaveModelImpl>(this, _$identity);
}

abstract class _SaveModel implements SaveModel {
  const factory _SaveModel(
          {required final Map<String, bool> tags,
          required final int currentSliderIndex,
          required final List<String> imagePaths,
          required final bool toggleCamera,
          required final String title,
          required final String savePath,
          required final CollectionDropdownModel collectionDropdownModel}) =
      _$SaveModelImpl;

  @override
  Map<String, bool> get tags;
  @override
  int get currentSliderIndex;
  @override
  List<String> get imagePaths;
  @override
  bool get toggleCamera;
  @override
  String get title;
  @override
  String get savePath;
  @override
  CollectionDropdownModel get collectionDropdownModel;
  @override
  @JsonKey(ignore: true)
  _$$SaveModelImplCopyWith<_$SaveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
