// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeModel {
  List<CollectionNode> get collectionNodes =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res, HomeModel>;
  @useResult
  $Res call({List<CollectionNode> collectionNodes});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res, $Val extends HomeModel>
    implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionNodes = null,
  }) {
    return _then(_value.copyWith(
      collectionNodes: null == collectionNodes
          ? _value.collectionNodes
          : collectionNodes // ignore: cast_nullable_to_non_nullable
              as List<CollectionNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeModelImplCopyWith<$Res>
    implements $HomeModelCopyWith<$Res> {
  factory _$$HomeModelImplCopyWith(
          _$HomeModelImpl value, $Res Function(_$HomeModelImpl) then) =
      __$$HomeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CollectionNode> collectionNodes});
}

/// @nodoc
class __$$HomeModelImplCopyWithImpl<$Res>
    extends _$HomeModelCopyWithImpl<$Res, _$HomeModelImpl>
    implements _$$HomeModelImplCopyWith<$Res> {
  __$$HomeModelImplCopyWithImpl(
      _$HomeModelImpl _value, $Res Function(_$HomeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionNodes = null,
  }) {
    return _then(_$HomeModelImpl(
      collectionNodes: null == collectionNodes
          ? _value._collectionNodes
          : collectionNodes // ignore: cast_nullable_to_non_nullable
              as List<CollectionNode>,
    ));
  }
}

/// @nodoc

class _$HomeModelImpl implements _HomeModel {
  const _$HomeModelImpl({required final List<CollectionNode> collectionNodes})
      : _collectionNodes = collectionNodes;

  final List<CollectionNode> _collectionNodes;
  @override
  List<CollectionNode> get collectionNodes {
    if (_collectionNodes is EqualUnmodifiableListView) return _collectionNodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collectionNodes);
  }

  @override
  String toString() {
    return 'HomeModel(collectionNodes: $collectionNodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeModelImpl &&
            const DeepCollectionEquality()
                .equals(other._collectionNodes, _collectionNodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collectionNodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeModelImplCopyWith<_$HomeModelImpl> get copyWith =>
      __$$HomeModelImplCopyWithImpl<_$HomeModelImpl>(this, _$identity);
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {required final List<CollectionNode> collectionNodes}) = _$HomeModelImpl;

  @override
  List<CollectionNode> get collectionNodes;
  @override
  @JsonKey(ignore: true)
  _$$HomeModelImplCopyWith<_$HomeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CollectionNode {
  String get path => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  List<CollectionNode> get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CollectionNodeCopyWith<CollectionNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionNodeCopyWith<$Res> {
  factory $CollectionNodeCopyWith(
          CollectionNode value, $Res Function(CollectionNode) then) =
      _$CollectionNodeCopyWithImpl<$Res, CollectionNode>;
  @useResult
  $Res call({String path, String displayName, List<CollectionNode> children});
}

/// @nodoc
class _$CollectionNodeCopyWithImpl<$Res, $Val extends CollectionNode>
    implements $CollectionNodeCopyWith<$Res> {
  _$CollectionNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? displayName = null,
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CollectionNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionNodeImplCopyWith<$Res>
    implements $CollectionNodeCopyWith<$Res> {
  factory _$$CollectionNodeImplCopyWith(_$CollectionNodeImpl value,
          $Res Function(_$CollectionNodeImpl) then) =
      __$$CollectionNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, String displayName, List<CollectionNode> children});
}

/// @nodoc
class __$$CollectionNodeImplCopyWithImpl<$Res>
    extends _$CollectionNodeCopyWithImpl<$Res, _$CollectionNodeImpl>
    implements _$$CollectionNodeImplCopyWith<$Res> {
  __$$CollectionNodeImplCopyWithImpl(
      _$CollectionNodeImpl _value, $Res Function(_$CollectionNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? displayName = null,
    Object? children = null,
  }) {
    return _then(_$CollectionNodeImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CollectionNode>,
    ));
  }
}

/// @nodoc

class _$CollectionNodeImpl implements _CollectionNode {
  const _$CollectionNodeImpl(
      {required this.path,
      required this.displayName,
      required final List<CollectionNode> children})
      : _children = children;

  @override
  final String path;
  @override
  final String displayName;
  final List<CollectionNode> _children;
  @override
  List<CollectionNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'CollectionNode(path: $path, displayName: $displayName, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionNodeImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, displayName,
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionNodeImplCopyWith<_$CollectionNodeImpl> get copyWith =>
      __$$CollectionNodeImplCopyWithImpl<_$CollectionNodeImpl>(
          this, _$identity);
}

abstract class _CollectionNode implements CollectionNode {
  const factory _CollectionNode(
      {required final String path,
      required final String displayName,
      required final List<CollectionNode> children}) = _$CollectionNodeImpl;

  @override
  String get path;
  @override
  String get displayName;
  @override
  List<CollectionNode> get children;
  @override
  @JsonKey(ignore: true)
  _$$CollectionNodeImplCopyWith<_$CollectionNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
