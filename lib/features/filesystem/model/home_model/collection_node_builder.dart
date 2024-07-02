import 'dart:io';

import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';

class CollectionNodeBuilder {
  static List<CollectionNode> build() {
    return _addChildren(ConfigParameters.fileSystemPath);
  }

  static List<CollectionNode> _addChildren(final String path) {
    final Directory directory = Directory(path);
    final List<CollectionNode> items = <CollectionNode>[];
    for (FileSystemEntity entity in directory.listSync()) {
      if (entity is Directory) {
        items.add(CollectionNode(
          path: entity.path,
          displayName: entity.path.split('/').last,
          children: _addChildren(entity.path),
        ));
      }
      if (entity is File && entity.path.endsWith('.pdf')) {
        items.add(CollectionNode(
          path: entity.path,
          displayName: entity.path.split('/').last.replaceAll('.pdf', ''),
          children: <CollectionNode>[],
        ));
      }
    }
    items.sort((final CollectionNode a, final CollectionNode b) =>
        a.displayName.compareTo(b.displayName));
    return items;
  }
}
