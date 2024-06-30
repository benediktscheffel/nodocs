import 'dart:io';

abstract class FileSystemService {
  Future<Directory>? createCollection(final String name);

  Future<FileSystemEntity>? deleteCollectionOrFile(final String path);

  Future<FileSystemEntity>? renameCollectionOrFile(
      final String oldPath, final String newName);

  String getRootDirectory();
}
