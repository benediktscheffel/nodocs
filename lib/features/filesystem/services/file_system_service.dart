import 'dart:io';

import 'package:nodocs/config/config_parameters.dart';


class FileSystemService {
  Future<Directory>? createCollection(final String name) {
    if (name.isEmpty) {
      return null;
    }
    return Directory('${ConfigParameters.fileSystemPath}$name').create();
  }

  Future<FileSystemEntity>? deleteCollectionOrFile(final String path) {
    if (path.isEmpty) {
      return null;
    }
    final FileSystemEntity entity = File(path);
    if (entity.existsSync()) {
      return entity.delete();
    }
    return null;
  }
}
