import 'package:flutter/material.dart';
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
  void showCreateCollectionModal() {
    _log.i("Showing create collection modal");
    navigationService.showPopup<void>(
        CollectionCreateDialog(onSave: createCollection())
    );
  }

  @override
  void showConfirmDeletionDialog(final BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) => ConfirmationDialog(
              onConfirm: () => deleteCollectionOrFile,
              // close dialog
              onCancel: () {},
              header: 'Confirm Deletion',
              notificationText: 'Are you sure you want to delete this file?',
            ));
  }

  @override
  Function(String) createCollection() {
    return (final String fileName) => fileSystemService
        .createCollection(fileName)!
        .then((final _) => updateState(CollectionNodeBuilder.build()));
  }

  @override
  Function(String) getPath() {
    return (final String path) => <void>{_log.i("Path: $path")};
  }

  @override
  Function(String) get deleteCollectionOrFile {
    return (final String path) => fileSystemService
        .deleteCollectionOrFile(path)!
        .then((final _) => updateState(CollectionNodeBuilder.build()));
  }

  @override
  void goToPage(final Uri uri) {
    _log.i("Navigating to: ${uri.toString()}");
    navigationService.push(uri.toString());
  }
}
