
abstract class HomeController {
  void goToPage(final Uri uri);

  void goBack();

  void goBackTwice();

  Function(String) createCollection();

  void deleteCollectionOrFile(final String path);

  Function(String) renameCollectionOrFile(final String path);
}
