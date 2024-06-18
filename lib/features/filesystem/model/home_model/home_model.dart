import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required final List<CollectionNode> collectionNodes,
  }) = _HomeModel;
}

@freezed
class CollectionNode with _$CollectionNode {
  const factory CollectionNode({
    required final String path,
    required final String displayName,
    required final List<CollectionNode> children,
  }) = _CollectionNode;
}