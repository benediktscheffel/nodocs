import 'dart:io';

import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/filesystem/services/file_system_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'file_system_service_aggregator.dart';

class FileSystemServiceImpl extends FileSystemService {
  @override
  Future<Directory>? createCollection(final String name) {
    if (name.isEmpty) {
      return null;
    }
    return Directory('${ConfigParameters.fileSystemPath}$name').create();
  }

  @override
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
