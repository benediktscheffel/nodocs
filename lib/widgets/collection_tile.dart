import 'package:flutter/material.dart';

import 'collection_tile_dialog.dart';

class CollectionTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData leading;
  final Widget? trailing;

  const CollectionTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.leading,
    this.trailing,
  });

  _onLongPress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CollectionTileDialog(
          onRename: () {},
          onDelete: () {},
          onShare: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 2),
      child: ListTile(
        title:
            Text(title, style: TextStyle(color: theme.colorScheme.onSecondary)),
        leading: Icon(leading, color: theme.colorScheme.onSecondary),
        onTap: onPressed,
        onLongPress: () => _onLongPress(context),
        trailing: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
