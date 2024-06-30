import 'dart:io';
import 'package:logger/logger.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/filesystem/services/file_system_access/file_system_service.dart';
import 'package:nodocs/util/logging/log.dart';

class FileSystemServiceImpl implements FileSystemService {
  final Logger _log = getLogger();

  @override
  Future<Directory>? createCollection(final String name) {
    if (name.isEmpty) {
      return null;
    }
    return Directory('${ConfigParameters.fileSystemPath}$name').create();
  }

  @override
  Future<FileSystemEntity>? deleteCollectionOrFile(final String path) {
    _log.d('deleting $path');
    if (path.isEmpty) {
      return null;
    }
    final Directory entity = Directory(path);
    if (entity.existsSync()) {
      return entity.delete(recursive: true);
    }
    return null;
  }

  Future<Directory>? _renameCollection(
      final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return null;
    }
    final Directory oldDirectory = Directory(oldPath);
    if (oldDirectory.existsSync()) {
      final Directory newDirectory =
          Directory('${oldDirectory.parent.path}/$newName');
      return oldDirectory.rename(newDirectory.path);
    }
    return null;
  }

  Future<File>? _renamePdfFile(final String oldPath, final String newName) {
    if (oldPath.isEmpty || newName.isEmpty) {
      return null;
    }
    final File oldFile = File(oldPath);
    if (oldFile.existsSync()) {
      final File newFile =
          File('${oldFile.parent.path}/${_nameToPdf(newName)}');
      return oldFile.rename(newFile.path);
    }
    return null;
  }

  @override
  Future<FileSystemEntity>? renameCollectionOrFile(
      final String oldPath, final String newName) {
    if (oldPath.endsWith('.pdf')) {
      return _renamePdfFile(oldPath, newName);
    }
    return _renameCollection(oldPath, newName);
  }

  String _nameToPdf(final String name) {
    return name.endsWith('.pdf') ? name : '$name.pdf';
  }

  @override
  String getRootDirectory() {
    return ConfigParameters.fileSystemPath;
  }
}
