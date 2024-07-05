abstract class SearchResultController {
  // Search
  Future<List<String>> search(final String search);
  List<String> getTags(final String path);
  int getCountOfTextOccurrences(final String path);

  // Navigation
  void goToPage(final Uri uri);
}