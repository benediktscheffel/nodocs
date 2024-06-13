import 'dart:io';

import 'collection_node.dart';

class CollectionNodeBuilder {
  static const String _absolutPath = '/data/data/com.example.nodocs/files';

  static List<CollectionNode> build() {
    return _addChildren(_absolutPath);
  }

  static List<CollectionNode> _addChildren(final String path) {
    final Directory directory = Directory(path);
    final List<CollectionNode> items = <CollectionNode>[];
    for (FileSystemEntity entity in directory.listSync()) {
      if (entity is Directory) {
        items.add(CollectionNode(
          path: entity.path,
          displayName: entity.path
              .split('/')
              .last,
          children: _addChildren(entity.path),
        )
        );
      }
      if (entity is File && entity.path.endsWith('.pdf')) {
        items.add(CollectionNode(
          path: entity.path,
          displayName: entity.path
              .split('/')
              .last
              .replaceAll('.pdf', ''),
          children: <CollectionNode>[],
        )
        );
      }
    }
    return items;
  }
}