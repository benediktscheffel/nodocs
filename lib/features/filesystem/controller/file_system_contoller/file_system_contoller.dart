import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/model/collection_node/collection_node.dart';


abstract class FileSystemController {

  /*void createDirectory(final String path);
  void createFile(final String path);
  void deleteDirectory(final String path);
  void deleteFile(final String path);
  bool fileExists(final String path);
  void moveDirectory(final String from, final String to);
  void moveFile(final String from, final String to);*/

  List<CollectionNode> build();


  Function pdfViewerRoute();

  void showCreateCollectionModal(final BuildContext context);

}