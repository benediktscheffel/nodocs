abstract class TagPersistenceService {
  Future<void> init();

  Future<void> deleteTagFromFile(final String filePath, final String tagName);

  Future<void> deleteTag(final String tagName);

  Future<void> deleteFile(final String filePath);

  Future<void> addTagToFile(final String filePath, final String tagName);

  Future<int> insertTag(final String tagName);

  Future<int> insertFile(final String filePath);

  Future<void> updateFile(final String oldPath, final String newPath);

  Future<void> addTagsToFile(
      final String filePath, final List<String> tagNames);

  Future<List<String>> loadTags(final String filePath);
}
