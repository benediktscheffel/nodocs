import 'package:flutter/material.dart';


abstract class HomeController {

  Function(String) pdfViewerRoute();

  void showCreateCollectionModal(final BuildContext context);

  Function(String) createCollection();
  
  Function(String) get deleteCollectionOrFile;

  Function(String) getPath();
}