import 'package:flutter/material.dart';

abstract class CollectionTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;

  const CollectionTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.onLongPress,
  });
}

class FileCollectionTile extends CollectionTile {
  const FileCollectionTile({
    super.key,
    required super.title,
    required super.onPressed,
    required super.onLongPress,
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
      onLongPress: onLongPress,
    );
  }
}

class FolderCollectionTile extends CollectionTile {
  const FolderCollectionTile({
    super.key,
    required super.title,
    required super.onPressed,
    required super.onLongPress,
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
        onLongPress: onLongPress,
        trailing: IconButton(
          color: theme.colorScheme.onSecondary,
          icon: const Icon(Icons.arrow_right),
          onPressed: () {},
        ));
  }
}
