import 'package:flutter/material.dart';


abstract class HomeController {

  void showCreateCollectionModal();

  void showConfirmDeletionDialog(final BuildContext context);

  void goToPage(final Uri uri);

  Function(String) createCollection();
  
  Function(String) get deleteCollectionOrFile;

  Function(String) getPath();
}