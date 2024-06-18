import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/util/logging/log.dart';

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

  Option<Directory> _renameCollection(
      final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return const Option<Directory>.none();
    }
    final Directory oldDirectory = Directory(oldPath);
    if (oldDirectory.existsSync()) {
      final Directory newDirectory =
          Directory('${oldDirectory.parent.path}/$newName');
      return Option<Directory>.fromNullable(
          oldDirectory.renameSync(newDirectory.path));
    }
    return const Option<Directory>.none();
  }

  Option<File> _renamePdfFile(final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return const Option<File>.none();
    }
    final File oldFile = File(oldPath);
    if (oldFile.existsSync()) {
      final File newFile = File('${oldFile.parent.path}/${_nameToPdf(newName)}');
      return Option<File>.fromNullable(oldFile.renameSync(newFile.path));
    }
    return const Option<File>.none();
  }

  bool newPathAlreadyExist(final String path, final String name) {
    final FileSystemEntity entity = File('$path/$name');
    return entity.existsSync();
  }

  Option<FileSystemEntity> renameCollectionOrFile(final String oldPath, final String newName) {
    if (oldPath.endsWith('.pdf')) {
      return _renamePdfFile(oldPath, newName);
    }
    return _renameCollection(oldPath, newName);
  }

  String _nameToPdf(final String name) {
    return name.endsWith('.pdf') ? name : '$name.pdf';
  }
}
