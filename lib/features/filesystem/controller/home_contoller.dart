import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';

abstract class HomeController {
  void goToPage(final Uri uri);

  void goBack();

  void goBackTwice();

  Function(String) createCollection();

  void deleteCollectionOrFile(final String path);

  Function(String) renameCollectionOrFile(final String path);

  List<CollectionNode> getCollectionNodes();

  void shareFile(final String path, final String fileName);

}
