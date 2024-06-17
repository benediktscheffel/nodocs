import 'dart:io';

abstract class FileSystemService {
  Future<Directory>? createCollection(final String name);
  Future<FileSystemEntity>? deleteCollectionOrFile(final String path);

}