import 'package:isar/isar.dart';

part 'tag_tables.g.dart';

@collection
class TagDO {
  Id id = Isar.autoIncrement;
  late final String name;

  final IsarLinks<FileDO> tableAs = IsarLinks<FileDO>();
}

@collection
class FileDO {
  Id id = Isar.autoIncrement;

  late final String path;

  final IsarLinks<TagDO> tableAs = IsarLinks<TagDO>();
}
