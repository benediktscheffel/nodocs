import 'package:isar/isar.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/tags/services/persistence/tag_persistence_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/tables/tag_tables.dart';
import 'package:nodocs/util/hash/fast_hash_function.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_tag_persistence_service.g.dart';

@Riverpod(keepAlive: true)
TagPersistenceService tagPersistenceService(
        final TagPersistenceServiceRef ref) =>
    IsarTagPersistenceService();

class IsarTagPersistenceService extends TagPersistenceService {
  late final Isar isar;

  IsarTagPersistenceService();

  @override
  Future<void> init() async {
    isar = await Isar.open(
      name: 'nodocs',
      directory: ConfigParameters.fileSystemPath,
      <CollectionSchema<Object>>[FileDOSchema, TagDOSchema],
    );
  }

  @override
  Future<void> addTagToFile(final String filePath, final String tagName) async {
    final TagDO? tag = await isar.tagDOs.get(Hash.fastHash(tagName));
    if (tag == null) {
      isar.tagDOs.put(TagDO()..name = tagName);
    }

    isar.fileDOs.get(Hash.fastHash(filePath)).then((final FileDO? file) {
      if (file != null) {
        file.tableAs.add(tag!);
        isar.fileDOs.put(file);
      }
    });
  }

  @override
  Future<void> deleteFile(final String filePath) async {
    isar.fileDOs.delete(Hash.fastHash(filePath));
  }

  @override
  Future<void> deleteTag(final String tagName) async {
    isar.tagDOs.delete(Hash.fastHash(tagName));
  }

  @override
  Future<void> deleteTagFromFile(
      final String filePath, final String tagName) async {
    final TagDO? tag = await isar.tagDOs.get(Hash.fastHash(tagName));
    isar.fileDOs.get(Hash.fastHash(filePath)).then((final FileDO? file) {
      if (file != null) {
        file.tableAs.remove(tag);
        isar.fileDOs.put(file);
      }
    });
  }

  @override
  Future<int> insertFile(final String filePath) async {
    final FileDO file = FileDO()..path = filePath;
    return isar.fileDOs.put(file);
  }

  @override
  Future<int> insertTag(final String tagName) {
    final TagDO tag = TagDO()..name = tagName;
    return isar.tagDOs.put(tag);
  }

  @override
  Future<void> updateFile(final String oldPath, final String newPath) {
    return isar.fileDOs.get(Hash.fastHash(oldPath)).then((final FileDO? file) {
      if (file != null) {
        file.path = newPath;
        file.id = Hash.fastHash(newPath);
        isar.fileDOs.put(file);
      }
    });
  }

  @override
  Future<void> addTagsToFile(
    final String filePath,
    final List<String> tagNames,
  ) {
    return isar.fileDOs.get(Hash.fastHash(filePath)).then((final FileDO? file) {
      if (file != null) {
        for (final String tagName in tagNames) {
          isar.tagDOs.get(Hash.fastHash(tagName)).then((final TagDO? tag) {
            if (tag != null) {
              file.tableAs.add(tag);
              isar.fileDOs.put(file);
            } else {
              final TagDO tag = TagDO()..name = tagName;
              isar.tagDOs.put(tag).then((final int id) {
                file.tableAs.add(tag);
                isar.fileDOs.put(file);
              });
            }
          });
        }
      }
    });
  }

  @override
  Future<List<String>> loadTags(final String filePath) {
    return isar.fileDOs.get(Hash.fastHash(filePath)).then((final FileDO? file) {
      if (file != null) {
        return file.tableAs.map((final TagDO tag) => tag.name).toList();
      } else {
        return <String>[];
      }
    });
  }
}
