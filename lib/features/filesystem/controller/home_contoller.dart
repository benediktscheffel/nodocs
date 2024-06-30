abstract class HomeController {
  void updateState();

  void goToPage(final Uri uri);

  void goBack();

  void goBackTwice();

  Function(String) createCollection();

  void deleteCollectionOrFile(final String path);

  Function(String) renameCollectionOrFile(final String path);

  void shareFile(final String path, final String fileName);

  Future<void> addFile(final String collectionPath);
}
