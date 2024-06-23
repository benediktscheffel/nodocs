import 'package:isar/isar.dart';
import 'package:nodocs/util/hash/fast_hash_function.dart';

part 'tag_tables.g.dart';

@collection
class TagDO {
  late final String name;

  Id get id => Hash.fastHash(name);

  final IsarLinks<FileDO> tableBs = IsarLinks<FileDO>();
}

@collection
class FileDO {
  Id get id => Hash.fastHash(path);

  late final String path;

  final IsarLinks<TagDO> tableAs = IsarLinks<TagDO>();

  set id(final Id id) => this.id = id;
}
