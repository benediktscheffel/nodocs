import 'dart:io';

import 'package:nodocs/config/config_parameters.dart';

class FileSystemAccess {
  FileSystemAccess();

  void createCollection(final String name) {
    if(name.isEmpty) {
      throw Exception('Name must not be empty');
    }
    const String fileSystemPath = ConfigParameters.fileSystemPath;
    final Directory directory = Directory('$fileSystemPath/$name');
    directory.createSync();
  }

  }