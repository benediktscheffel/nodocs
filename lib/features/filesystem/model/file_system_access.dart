import 'dart:io';

class FileSystemAccess {

  FileSystemAccess();


  static const String _absolutePath = '/data/data/com.example.nodocs/files';

  Future<void> createDirectory(final String name) async {
    final Directory directory = Directory('$_absolutePath/$name');
    directory.createSync();
  }

  }