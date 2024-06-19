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
  String get selectedImagePath => throw _privateConstructorUsedError;
  String get imageFolder => throw _privateConstructorUsedError;
  Set<String> get imagePaths => throw _privateConstructorUsedError;
  Set<String> get tags => throw _privateConstructorUsedError;
  Set<Widget> get imageSliders => throw _privateConstructorUsedError;
  int get currentSliderIndex => throw _privateConstructorUsedError;

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
      {String selectedImagePath,
      String imageFolder,
      Set<String> imagePaths,
      Set<String> tags,
      Set<Widget> imageSliders,
      int currentSliderIndex});
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
    Object? selectedImagePath = null,
    Object? imageFolder = null,
    Object? imagePaths = null,
    Object? tags = null,
    Object? imageSliders = null,
    Object? currentSliderIndex = null,
  }) {
    return _then(_value.copyWith(
      selectedImagePath: null == selectedImagePath
          ? _value.selectedImagePath
          : selectedImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      imageFolder: null == imageFolder
          ? _value.imageFolder
          : imageFolder // ignore: cast_nullable_to_non_nullable
              as String,
      imagePaths: null == imagePaths
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      imageSliders: null == imageSliders
          ? _value.imageSliders
          : imageSliders // ignore: cast_nullable_to_non_nullable
              as Set<Widget>,
      currentSliderIndex: null == currentSliderIndex
          ? _value.currentSliderIndex
          : currentSliderIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
      {String selectedImagePath,
      String imageFolder,
      Set<String> imagePaths,
      Set<String> tags,
      Set<Widget> imageSliders,
      int currentSliderIndex});
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
    Object? selectedImagePath = null,
    Object? imageFolder = null,
    Object? imagePaths = null,
    Object? tags = null,
    Object? imageSliders = null,
    Object? currentSliderIndex = null,
  }) {
    return _then(_$SaveModelImpl(
      selectedImagePath: null == selectedImagePath
          ? _value.selectedImagePath
          : selectedImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      imageFolder: null == imageFolder
          ? _value.imageFolder
          : imageFolder // ignore: cast_nullable_to_non_nullable
              as String,
      imagePaths: null == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      imageSliders: null == imageSliders
          ? _value._imageSliders
          : imageSliders // ignore: cast_nullable_to_non_nullable
              as Set<Widget>,
      currentSliderIndex: null == currentSliderIndex
          ? _value.currentSliderIndex
          : currentSliderIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SaveModelImpl implements _SaveModel {
  const _$SaveModelImpl(
      {required this.selectedImagePath,
      required this.imageFolder,
      required final Set<String> imagePaths,
      required final Set<String> tags,
      required final Set<Widget> imageSliders,
      required this.currentSliderIndex})
      : _imagePaths = imagePaths,
        _tags = tags,
        _imageSliders = imageSliders;

  @override
  final String selectedImagePath;
  @override
  final String imageFolder;
  final Set<String> _imagePaths;
  @override
  Set<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableSetView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_imagePaths);
  }

  final Set<String> _tags;
  @override
  Set<String> get tags {
    if (_tags is EqualUnmodifiableSetView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_tags);
  }

  final Set<Widget> _imageSliders;
  @override
  Set<Widget> get imageSliders {
    if (_imageSliders is EqualUnmodifiableSetView) return _imageSliders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_imageSliders);
  }

  @override
  final int currentSliderIndex;

  @override
  String toString() {
    return 'SaveModel(selectedImagePath: $selectedImagePath, imageFolder: $imageFolder, imagePaths: $imagePaths, tags: $tags, imageSliders: $imageSliders, currentSliderIndex: $currentSliderIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveModelImpl &&
            (identical(other.selectedImagePath, selectedImagePath) ||
                other.selectedImagePath == selectedImagePath) &&
            (identical(other.imageFolder, imageFolder) ||
                other.imageFolder == imageFolder) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._imageSliders, _imageSliders) &&
            (identical(other.currentSliderIndex, currentSliderIndex) ||
                other.currentSliderIndex == currentSliderIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedImagePath,
      imageFolder,
      const DeepCollectionEquality().hash(_imagePaths),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_imageSliders),
      currentSliderIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveModelImplCopyWith<_$SaveModelImpl> get copyWith =>
      __$$SaveModelImplCopyWithImpl<_$SaveModelImpl>(this, _$identity);
}

abstract class _SaveModel implements SaveModel {
  const factory _SaveModel(
      {required final String selectedImagePath,
      required final String imageFolder,
      required final Set<String> imagePaths,
      required final Set<String> tags,
      required final Set<Widget> imageSliders,
      required final int currentSliderIndex}) = _$SaveModelImpl;

  @override
  String get selectedImagePath;
  @override
  String get imageFolder;
  @override
  Set<String> get imagePaths;
  @override
  Set<String> get tags;
  @override
  Set<Widget> get imageSliders;
  @override
  int get currentSliderIndex;
  @override
  @JsonKey(ignore: true)
  _$$SaveModelImplCopyWith<_$SaveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
