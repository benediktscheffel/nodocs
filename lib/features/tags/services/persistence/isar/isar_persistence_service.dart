import 'package:isar/isar.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/tables/tag_tables.dart';
import 'package:nodocs/util/hash/fast_hash_function.dart';

class IsarPersistenceService extends PersistenceService {
  final Isar isar;

  IsarPersistenceService({required this.isar});

  @override
  Future<void> addTagToFile(final String filePath, final String tagName) async {
    final Tag? tag = await isar.tags.get(Hash.fastHash(tagName));
    if (tag == null) {
      isar.tags.put(Tag()..name = tagName);
    }

    isar.files.get(Hash.fastHash(filePath)).then((final File? file) {
      if (file != null) {
        file.tableAs.add(tag!);
        isar.files.put(file);
      }
    });
  }

  @override
  Future<void> deleteFile(final String filePath) async {
    isar.files.delete(Hash.fastHash(filePath));
  }

  @override
  Future<void> deleteTag(final String tagName) async {
    isar.tags.delete(Hash.fastHash(tagName));
  }

  @override
  Future<void> deleteTagFromFile(
      final String filePath, final String tagName) async {
    final Tag? tag = await isar.tags.get(Hash.fastHash(tagName));
    isar.files.get(Hash.fastHash(filePath)).then((final File? file) {
      if (file != null) {
        file.tableAs.remove(tag);
        isar.files.put(file);
      }
    });
  }

  @override
  Future<int> insertFile(final String filePath) async {
    final File file = File()..path = filePath;
    return isar.files.put(file);
  }

  @override
  Future<int> insertTag(final String tagName) {
    final Tag tag = Tag()..name = tagName;
    return isar.tags.put(tag);
  }

  @override
  Future<void> updateFile(final String oldPath, final String newPath) {
    return isar.files.get(Hash.fastHash(oldPath)).then((final File? file) {
      if (file != null) {
        file.path = newPath;
        file.id = Hash.fastHash(newPath);
        isar.files.put(file);
      }
    });
  }

  @override
  Future<void> addTagsToFile(
      final String filePath, final List<String> tagNames) {
    return isar.files.get(Hash.fastHash(filePath)).then((final File? file) {
      if (file != null) {
        for (final String tagName in tagNames) {
          isar.tags.get(Hash.fastHash(tagName)).then((final Tag? tag) {
            if (tag != null) {
              file.tableAs.add(tag);
              isar.files.put(file);
            } else {
              final Tag tag = Tag()..name = tagName;
              isar.tags.put(tag).then((final int id) {
                file.tableAs.add(tag);
                isar.files.put(file);
              });
            }
          });
        }
      }
    });
  }
}
