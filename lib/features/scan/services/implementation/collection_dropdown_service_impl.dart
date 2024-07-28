import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/scan/model/collection_dropdown_model.dart';
import 'package:nodocs/features/scan/services/collection_dropdown_service.dart';
import 'package:nodocs/util/logging/log.dart';

class CollectionDropdownServiceImpl implements CollectionDropdownService {
  static final Logger _log = getLogger();
  @override
  CollectionDropdownModel getCollectionDropdown() {
    final Directory directory = Directory(ConfigParameters.fileSystemPath);
    if (directory.existsSync()) {
      return CollectionDropdownModel(
        currentPath: directory.path,
        paths: _listDirectories(directory.path),
      );
    }
    return CollectionDropdownModel(
      currentPath: '/',
      paths: <String>[],
    );
  }

  @override
  CollectionDropdownModel closeCollection(final String path) {
    final Directory directory = Directory(path);
    if (directory.existsSync()) {
      return CollectionDropdownModel(
        currentPath: directory.parent.path,
        paths: _listDirectories(directory.parent.path),
      );
    }
    return CollectionDropdownModel(
      currentPath: '/',
      paths: <String>[],
    );
  }

  @override
  CollectionDropdownModel openCollection(final String path) {
    return CollectionDropdownModel(
      currentPath: path,
      paths: _listDirectories(path),
    );
  }

  List<String> _listDirectories(final String path) {
    final Directory directory = Directory(path);
    _log.i('Listing directories in $path');
    if (directory.existsSync()) {
      final List<FileSystemEntity> entities = directory.listSync();
      List<String> e = entities
          .filter((final FileSystemEntity entity) => entity is Directory)
          .map((final FileSystemEntity entity) => entity.path)
          .toList();
      _log.i('Found: $e');
      return e;
    }
    return <String>[];
  }
}
