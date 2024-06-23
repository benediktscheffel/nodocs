import 'package:isar/isar.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/tags/services/persistence/tag_persistence_service.dart';
import 'package:nodocs/features/tags/services/persistence/isar/tables/tag_tables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_tag_persistence_service.g.dart';

@Riverpod(keepAlive: true)
TagPersistenceService tagPersistenceService(
        final TagPersistenceServiceRef ref) =>
    IsarTagPersistenceService();

class IsarTagPersistenceService extends TagPersistenceService {
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
      final String filePath, final List<String> tagNames) async {
    final FileDO? file =
        isar.fileDOs.filter().pathEqualTo(filePath).findFirstSync();
    if (file != null) {
      for (final String tagName in tagNames) {
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
    } else {
      isar.writeTxnSync(() => isar.fileDOs.put(FileDO()..path = filePath));
      return addTagsToFile(filePath, tagNames);
    }
  }

  @override
  Future<List<String>> loadTags(final String filePath) {
    return isar.fileDOs
        .filter()
        .pathEqualTo(filePath)
        .findFirst()
        .then((final FileDO? file) {
      if (file != null) {
        return file.tableAs.map((final TagDO tag) => tag.name).toList();
      } else {
        return <String>[];
      }
    });
  }
}
