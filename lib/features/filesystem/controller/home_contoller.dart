import 'package:flutter/material.dart';


abstract class HomeController {

  void showCreateCollectionModal();

  void showConfirmDeletionDialog(final BuildContext context);

  void goToPage(final Uri uri);

  void goBack();

  Function(String) createCollection();
  
  Function(String) deleteCollectionOrFile();

  Function(String, String) renameCollectionOrFile();

  Function(String) getPath();
}