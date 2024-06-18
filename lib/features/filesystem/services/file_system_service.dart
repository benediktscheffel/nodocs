import 'dart:io';

import 'package:logger/logger.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:optional/optional.dart';

class FileSystemService {

  final Logger _log = getLogger();

  Future<Directory>? createCollection(final String name) {
    if (name.isEmpty) {
      return null;
    }
    return Directory('${ConfigParameters.fileSystemPath}$name').create();
  }

  Future<FileSystemEntity>? deleteCollectionOrFile(final String path) {
    _log.d('deleting $path');

    if (path.isEmpty) {
      return null;
    }
    final Directory entity = Directory(path);
    if (entity.existsSync()) {
      _log.d('deleting $path');
      return entity.delete();
    }
    return null;
  }

  Future<FileSystemEntity>? _deletePdfFile(final String path) {
    if (path.isNotEmpty) {
      return Directory(path).delete();
    }
    return null;
  }

  Optional<Directory> renameCollection(
      final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return const Optional<Directory>.empty();
    }
    final Directory oldDirectory = Directory(oldPath);
    if (oldDirectory.existsSync()) {
      final Directory newDirectory =
          Directory('${oldDirectory.parent.path}/$newName');
      return Optional<Directory>.ofNullable(
          oldDirectory.renameSync(newDirectory.path));
    }
    return const Optional<Directory>.empty();
  }

  Optional<File> renamePdfFile(final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return const Optional<File>.empty();
    }
    final File oldFile = File(oldPath);
    if (oldFile.existsSync()) {
      final File newFile = File('${oldFile.parent.path}/$newName');
      return Optional<File>.ofNullable(oldFile.renameSync(newFile.path));
    }
    return const Optional<File>.empty();
  }

  bool newPathAlreadyExist(final String path, final String name) {
    final FileSystemEntity entity = File('$path/$name');
    return entity.existsSync();
  }
}
