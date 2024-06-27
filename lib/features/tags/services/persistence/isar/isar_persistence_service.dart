import 'package:isar/isar.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/tags/services/persistence/persistence_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/tables/tag_tables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_persistence_service.g.dart';

@Riverpod(keepAlive: true)
PersistenceService persistenceService(
        final PersistenceServiceRef ref) =>
    IsarPersistenceService();

class IsarPersistenceService extends PersistenceService {
  late final Isar isar;

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
    final FileDO? file =
        isar.fileDOs.filter().pathEqualTo(filePath).findFirstSync();
    final TagDO? tag =
        isar.tagDOs.filter().nameEqualTo(tagName).findFirstSync();
    if (file != null && tag != null) {
      file.tableAs.add(tag);
      await isar.writeTxn(() => isar.fileDOs.put(file));
    }
  }

  @override
  Future<void> deleteFile(final String filePath) async {
    await isar.writeTxn(
        () => isar.fileDOs.filter().pathEqualTo(filePath).deleteFirst());
  }

  @override
  Future<void> deleteTag(final String tagName) async {
    await isar.writeTxn(
        () => isar.tagDOs.filter().nameEqualTo(tagName).deleteFirst());
  }

  @override
  Future<void> deleteTagFromFile(
      final String filePath, final String tagName) async {
    final FileDO? file =
        isar.fileDOs.filter().pathEqualTo(filePath).findFirstSync();
    final TagDO? tag =
        isar.tagDOs.filter().nameEqualTo(tagName).findFirstSync();
    if (file != null && tag != null) {
      file.tableAs.remove(tag);
      tag.tableAs.remove(file);
      isar.writeTxn(() => tag.tableAs.save());
      isar.writeTxn(() => file.tableAs.save());
    }
  }

  @override
  Future<int> insertFile(final String filePath) async {
    final FileDO file = FileDO()..path = filePath;
    return await isar.writeTxn(() async => isar.fileDOs.put(file));
  }

  @override
  Future<int> insertTag(final String tagName) async {
    final TagDO tag = TagDO()..name = tagName;
    return await isar.writeTxn(() async => isar.tagDOs.put(tag));
  }

  @override
  Future<void> updateFile(final String oldPath, final String newPath) {
    final FileDO? file =
        isar.fileDOs.filter().pathEqualTo(oldPath).findFirstSync();
    if (file != null) {
      file.path = newPath;
      return isar.writeTxn(() => isar.fileDOs.put(file));
    } else {
      return Future<void>.value();
    }
  }

  @override
  Future<void> addTagsToFile(
      final String filePath, final List<String> tags) async {
    final FileDO? file =
        isar.fileDOs.filter().pathEqualTo(filePath).findFirstSync();
    if (file != null) {
      for (final String tagName in tags) {
        final TagDO? tag =
            isar.tagDOs.filter().nameEqualTo(tagName).findFirstSync();
        if (tag != null) {
          file.tableAs.add(tag);
          tag.tableAs.add(file);
          isar.writeTxn(() => tag.tableAs.save());
        } else {
          final TagDO newTag = TagDO()..name = tagName;
          newTag.tableAs.add(file);
          await isar.writeTxn(() => isar.tagDOs.put(newTag));
          isar.writeTxn(() => newTag.tableAs.save());
          file.tableAs.add(newTag);
        }
      }
      return isar.writeTxn(() => file.tableAs.save());
    }
  }

  @override
  Future<void> deleteTagsFromFile(
      final String filePath, final List<String> tags) async {
    FileDO? file = isar.fileDOs.filter().pathEqualTo(filePath).findFirstSync();
    if (file != null) {
      for (final String tagName in tags) {
        final List<TagDO> tags =
            isar.tagDOs.filter().nameEqualTo(tagName).findAllSync();
        if (tags.isNotEmpty) {
          for (final TagDO tagToDelete in tags) {
            file.tableAs.remove(tagToDelete);
            tagToDelete.tableAs.remove(file);
            if (tagToDelete.tableAs.isEmpty) {
              isar.writeTxn(() => isar.tagDOs.delete(tagToDelete.id));
            } else {
              isar.writeTxn(() => tagToDelete.tableAs.save());
            }
          }
        }
      }
      return isar.writeTxn(() => file.tableAs.save());
    }
  }

  @override
  List<(String, bool)> loadTags(final String filePath) {
    return isar.tagDOs
        .filter()
        .nameIsNotEmpty()
        .findAllSync()
        .map((final TagDO tag) => (
              tag.name,
              tag.tableAs
                  .map((final FileDO file) => file.path)
                  .contains(filePath)
            ))
        .toList();
  }
}
