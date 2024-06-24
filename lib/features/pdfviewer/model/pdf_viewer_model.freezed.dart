// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_viewer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PdfViewerModel {
  List<Tag> get tags => throw _privateConstructorUsedError;
  bool get showToolbar => throw _privateConstructorUsedError;
  bool get showScrollHead => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PdfViewerModelCopyWith<PdfViewerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfViewerModelCopyWith<$Res> {
  factory $PdfViewerModelCopyWith(
          PdfViewerModel value, $Res Function(PdfViewerModel) then) =
      _$PdfViewerModelCopyWithImpl<$Res, PdfViewerModel>;
  @useResult
  $Res call({List<Tag> tags, bool showToolbar, bool showScrollHead});
}

/// @nodoc
class _$PdfViewerModelCopyWithImpl<$Res, $Val extends PdfViewerModel>
    implements $PdfViewerModelCopyWith<$Res> {
  _$PdfViewerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? showToolbar = null,
    Object? showScrollHead = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      showToolbar: null == showToolbar
          ? _value.showToolbar
          : showToolbar // ignore: cast_nullable_to_non_nullable
              as bool,
      showScrollHead: null == showScrollHead
          ? _value.showScrollHead
          : showScrollHead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PdfViewerModelImplCopyWith<$Res>
    implements $PdfViewerModelCopyWith<$Res> {
  factory _$$PdfViewerModelImplCopyWith(_$PdfViewerModelImpl value,
          $Res Function(_$PdfViewerModelImpl) then) =
      __$$PdfViewerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag> tags, bool showToolbar, bool showScrollHead});
}

/// @nodoc
class __$$PdfViewerModelImplCopyWithImpl<$Res>
    extends _$PdfViewerModelCopyWithImpl<$Res, _$PdfViewerModelImpl>
    implements _$$PdfViewerModelImplCopyWith<$Res> {
  __$$PdfViewerModelImplCopyWithImpl(
      _$PdfViewerModelImpl _value, $Res Function(_$PdfViewerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? showToolbar = null,
    Object? showScrollHead = null,
  }) {
    return _then(_$PdfViewerModelImpl(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      showToolbar: null == showToolbar
          ? _value.showToolbar
          : showToolbar // ignore: cast_nullable_to_non_nullable
              as bool,
      showScrollHead: null == showScrollHead
          ? _value.showScrollHead
          : showScrollHead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PdfViewerModelImpl implements _PdfViewerModel {
  const _$PdfViewerModelImpl(
      {required final List<Tag> tags,
      required this.showToolbar,
      required this.showScrollHead})
      : _tags = tags;

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final bool showToolbar;
  @override
  final bool showScrollHead;

  @override
  String toString() {
    return 'PdfViewerModel(tags: $tags, showToolbar: $showToolbar, showScrollHead: $showScrollHead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfViewerModelImpl &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.showToolbar, showToolbar) ||
                other.showToolbar == showToolbar) &&
            (identical(other.showScrollHead, showScrollHead) ||
                other.showScrollHead == showScrollHead));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tags), showToolbar, showScrollHead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfViewerModelImplCopyWith<_$PdfViewerModelImpl> get copyWith =>
      __$$PdfViewerModelImplCopyWithImpl<_$PdfViewerModelImpl>(
          this, _$identity);
}

abstract class _PdfViewerModel implements PdfViewerModel {
  const factory _PdfViewerModel(
      {required final List<Tag> tags,
      required final bool showToolbar,
      required final bool showScrollHead}) = _$PdfViewerModelImpl;

  @override
  List<Tag> get tags;
  @override
  bool get showToolbar;
  @override
  bool get showScrollHead;
  @override
  @JsonKey(ignore: true)
  _$$PdfViewerModelImplCopyWith<_$PdfViewerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Tag {
  String get name => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call({String name, bool selected});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagImplCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$TagImplCopyWith(_$TagImpl value, $Res Function(_$TagImpl) then) =
      __$$TagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool selected});
}

/// @nodoc
class __$$TagImplCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$TagImpl>
    implements _$$TagImplCopyWith<$Res> {
  __$$TagImplCopyWithImpl(_$TagImpl _value, $Res Function(_$TagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? selected = null,
  }) {
    return _then(_$TagImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TagImpl implements _Tag {
  const _$TagImpl({required this.name, required this.selected});

  @override
  final String name;
  @override
  final bool selected;

  @override
  String toString() {
    return 'Tag(name: $name, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      __$$TagImplCopyWithImpl<_$TagImpl>(this, _$identity);
}

abstract class _Tag implements Tag {
  const factory _Tag(
      {required final String name, required final bool selected}) = _$TagImpl;

  @override
  String get name;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
