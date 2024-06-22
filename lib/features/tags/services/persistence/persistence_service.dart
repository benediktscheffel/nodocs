import 'package:nodocs/features/tags/services/persistence/isar/tables/tag_tables.dart';

abstract class PersistenceService {
  Future<void> deleteTagFromFile(final String filePath, final String tagName);

  Future<void> deleteTag(final String tagName);

  Future<void> deleteFile(final String filePath);

  Future<void> addTagToFile(final String filePath, final Tag tag);

  Future<int> insertTag(final String tagName);

  Future<int> insertFile(final String filePath);

  Future<void> updateFile(final String oldPath, final String newPath);
}
