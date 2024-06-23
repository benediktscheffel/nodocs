import '../model/pdf_viewer_model.dart';

abstract class PdfController {
  void goToPage(final Uri uri);

  void goBack();

  void goBackTwice();

  void loadTags(final String filePath);

  void addTagToFile(final String filePath, final String tagName);

  void deleteTagFromFile(final String filePath, final String tagName);

  void addTagsToFile(final String filePath, final List<String> tagNames);

  void updateTags(final List<Tag> tags);
}
