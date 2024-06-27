import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/model/home_model/collection_node_builder.dart';
import 'package:nodocs/features/filesystem/services/file_system_service.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller_impl.g.dart';

@riverpod
class HomeControllerImpl extends _$HomeControllerImpl
    implements HomeController {
  final Logger _log = getLogger();

  @override
  HomeModel build({
    required final FileSystemService fileSystemService,
    required final NavigationService navigationService,
  }) {
    return HomeModel(collectionNodes: CollectionNodeBuilder.build());
  }

  void updateState(final List<CollectionNode> collectionNodes) {
    state = state.copyWith(collectionNodes: collectionNodes);
  }

  @override
  Function(String) createCollection() {
    return (final String fileName) => fileSystemService
        .createCollection(fileName)!
        .then((final _) => updateState(CollectionNodeBuilder.build()));
  }

  @override
  void deleteCollectionOrFile(final String path) {
    fileSystemService
        .deleteCollectionOrFile(path)!
        .then((final _) => updateState(CollectionNodeBuilder.build()));
  }

  @override
  void goToPage(final Uri uri) {
    navigationService.push(uri.toString());
  }

  @override
  void goBack() {
    navigationService.pop();
  }

  @override
  void goBackTwice() {
    navigationService.pop();
    navigationService.pop();
  }

  @override
  Function(String) renameCollectionOrFile(final String path) {
    return (final String newName) => fileSystemService
        .renameCollectionOrFile(path, newName)
        .map((final _) => updateState(CollectionNodeBuilder.build()))
        .getOrElse(() => _log.e("Failed to rename collection or file"));
  }
}
