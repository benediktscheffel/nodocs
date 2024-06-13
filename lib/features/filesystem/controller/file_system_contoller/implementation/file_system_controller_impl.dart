import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/controller/file_system_contoller/file_system_contoller.dart';
import 'package:nodocs/features/filesystem/model/collection_node/collection_node.dart';
import 'package:nodocs/features/filesystem/model/collection_node/collection_node_builder.dart';
import 'package:nodocs/features/filesystem/model/file_system_access.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'file_system_controller_impl.g.dart';

@riverpod
class FileSystemControllerImpl implements FileSystemController {

  FileSystemControllerImpl(this._fileSystemAccess);

  final FileSystemAccess _fileSystemAccess;

  @override
  List<CollectionNode> build() {
    return CollectionNodeBuilder.build();
  }

  @override
  Function pdfViewerRoute() {
    return (final String path) => PdfViewerRoute(path: path);
  }

  @override
  void showCreateCollectionModal(final BuildContext context) {
        showDialog<String>(
        context: context,
        builder: (final BuildContext context) =>
    const CollectionCreateDialog()
    );
  }

  void createCollection(final String fileName) {

  }
}