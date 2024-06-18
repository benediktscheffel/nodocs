import 'package:flutter/material.dart';

class CollectionTileDialog extends StatelessWidget {
  final String contextPath;
  final VoidCallback onRename;
  final Function(String) onDelete;
  final VoidCallback onShare;

  const CollectionTileDialog({
    super.key,
    required this.onRename,
    required this.onDelete,
    required this.onShare,
    required this.contextPath,
  });

  @override
  Widget build(final BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: SingleChildScrollView(
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.edit, color: colorScheme.onPrimary),
                title: Text('Rename',
                    style: TextStyle(color: colorScheme.onPrimary)),
                onTap: onRename,
              ),
              ListTile(
                trailing:
                    Icon(Icons.ios_share_sharp, color: colorScheme.onPrimary),
                title: Text('Share',
                    style: TextStyle(color: colorScheme.onPrimary)),
                onTap: onShare,
              ),
              Divider(
                color: colorScheme.onPrimary,
                height: 1,
                thickness: 2,
              ),
              ListTile(
                trailing: const Icon(Icons.delete, color: Colors.redAccent),
                title: const Text('Delete',
                    style: TextStyle(color: Colors.redAccent)),
                onTap: () => onDelete(contextPath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
