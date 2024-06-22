import 'package:isar/isar.dart';
import 'package:nodocs/util/hash/fast_hash_function.dart';

part 'tag_tables.g.dart';

@collection
class Tag {
  late final String name;

  Id get id => Hash.fastHash(name);

  final IsarLinks<File> tableBs = IsarLinks<File>();
}

@collection
class File {
  Id get id => Hash.fastHash(path);

  late final String path;

  final IsarLinks<Tag> tableAs = IsarLinks<Tag>();

  set id(final Id id) => this.id = id;
}
