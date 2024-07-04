abstract class SearchResultController {
  // Search
  Future<List<String>> search(final String search);

  // Navigation
  void goToPage(final Uri uri);
}