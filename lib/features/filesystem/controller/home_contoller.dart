import 'package:flutter/material.dart';


abstract class HomeController {

  void showCreateCollectionModal();

  void showConfirmDeletionDialog(final BuildContext context);

  void goToPage(final Uri uri);

  void goBack();

  void goBackTwice();

  Function(String) createCollection();
  
  void deleteCollectionOrFile(final String path);

  Function(String) renameCollectionOrFile(final String path);

}