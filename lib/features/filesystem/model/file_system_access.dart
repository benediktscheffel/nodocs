import 'dart:io';

import 'package:nodocs/config/config_parameters.dart';

class FileSystemAccess {
  FileSystemAccess();

  void createCollection(final String name) {
    if (name.isEmpty) {
      return;
    }
    Directory('${ConfigParameters.fileSystemPath}$name').create().then(
        (final Directory directory) =>
            print('Directory created: ${directory.path}'));
  }
}
