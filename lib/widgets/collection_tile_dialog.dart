import 'package:flutter/material.dart';

class CollectionTileDialog extends StatelessWidget {
  final VoidCallback onRename;
  final VoidCallback onDelete;
  final VoidCallback onShare;

  const CollectionTileDialog({
    super.key,
    required this.onRename,
    required this.onDelete,
    required this.onShare,
  });

  @override
  Widget build(final BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      // color: Colors.transparent,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.83),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            trailing: const Icon(Icons.edit, color: Colors.white),
            title: const Text('Rename', style: TextStyle(color: Colors.white)),
            onTap: onRename,
          ),
          ListTile(
            trailing: const Icon(Icons.ios_share_sharp, color: Colors.white),
            title: const Text('Share', style: TextStyle(color: Colors.white)),
            onTap: onShare,
          ),
          const Divider(
            color: Colors.white,
            height: 1,
            thickness: 2,
          ),
          ListTile(
            trailing: const Icon(Icons.delete, color: Colors.redAccent),
            title: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}
