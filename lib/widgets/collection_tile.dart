import 'package:flutter/material.dart';

import 'collection_tile_dialog.dart';

abstract class CollectionTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CollectionTile({
    super.key,
    required this.title,
    required this.onPressed,
  });

  _onLongPress(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CollectionTileDialog(
          onRename: () {},
          onDelete: () {},
          onShare: () {},
        );
      },
    );
  }
}

class FolderCollectionTile extends CollectionTile {
  const FolderCollectionTile({
    super.key,
    required super.title,
    required super.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
        title:
            Text(title, style: TextStyle(color: theme.colorScheme.onSecondary)),
        leading: Icon(
          Icons.folder_outlined,
          color: theme.colorScheme.onSecondary,
        ),
        onTap: onPressed,
        onLongPress: () => _onLongPress(context),
        trailing: IconButton(
          color: theme.colorScheme.onSecondary,
          icon: const Icon(Icons.arrow_right),
          onPressed: () {},
        ));
  }
}

class FileCollectionTile extends CollectionTile {
  const FileCollectionTile({
    super.key,
    required super.title,
    required super.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      title:
          Text(title, style: TextStyle(color: theme.colorScheme.onSecondary)),
      leading: Icon(
        Icons.picture_as_pdf_outlined,
        color: theme.colorScheme.onSecondary,
      ),
      onTap: onPressed,
      onLongPress: () => _onLongPress(context),
    );
  }
}
