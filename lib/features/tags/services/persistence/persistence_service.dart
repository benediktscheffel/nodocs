abstract class PersistenceService {
  Future<void> init();

  Future<void> deleteTagFromFile(final String filePath, final String tagName);

  Future<void> deleteTag(final String tagName);

  Future<void> deleteFile(final String filePath);

  Future<void> addTagToFile(final String filePath, final String tagName);

  Future<int> insertTag(final String tagName);

  Future<int> insertFile(final String filePath);

  Future<void> updateFile(final String oldPath, final String newPath);

  Future<void> addTagsToFile(final String filePath, final List<String> tags);

  List<(String, bool)> loadTags(final String filePath);

  Future<void> deleteTagsFromFile(
      final String filePath, final List<String> tags);

  Future<void> updateFilesInCollection(final String oldPath, final String newPath);

  List<String> loadAllTags();
}
