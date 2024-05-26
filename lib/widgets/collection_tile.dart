import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final IconData buttonIcon;
  final String title;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;

  // Is a tile that represents either a file or a folder in a collection
  const CollectionTile({
    super.key,
    required this.buttonIcon,
    required this.title,
    required this.onPressed,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
        title:
            Text(title, style: TextStyle(color: theme.colorScheme.onSecondary)),
        leading: Icon(
          buttonIcon,
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
