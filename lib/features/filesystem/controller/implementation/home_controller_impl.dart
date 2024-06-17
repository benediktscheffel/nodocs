import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/model/home_model/collection_node_builder.dart';
import 'package:nodocs/features/filesystem/services/file_system_service_impl.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller_impl.g.dart';

@riverpod
class HomeControllerImpl extends _$HomeControllerImpl
    implements HomeController {
  @override
  HomeModel build({
    required final FileSystemServiceImpl fileSystemService,
  }) {
    return HomeModel(collectionNodes: CollectionNodeBuilder.build());
  }

  void updateState(final List<CollectionNode> collectionNodes) {
    state = state.copyWith(collectionNodes: collectionNodes);
  }

  @override
  Function(String) pdfViewerRoute() {
    return (final String path) => PdfViewerRoute(path: path);
  }

  @override
  void showCreateCollectionModal(final BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) =>
            CollectionCreateDialog(onSave: createCollection));
  }

  Function(String) get createCollection {
    return (final String fileName) => fileSystemService
        .createCollection(fileName)!
        .then((final _) => updateState(CollectionNodeBuilder.build()));
  }
}
