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
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
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
              color: Colors.black,
              height: 1,
              thickness: 5,
            ),
            ListTile(
              trailing: const Icon(Icons.delete, color: Colors.white),
              title: const Text('Delete', style: TextStyle(color: Colors.white)),
              onTap: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}