import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_rename_dialog.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';

class CollectionTileDialog extends StatelessWidget {
  final String contextPath;
  final String contextName;
  final Function(String, String) onRename;
  final VoidCallback goBack;
  final Function(String) onDelete;
  final VoidCallback onShare;

  const CollectionTileDialog({
    super.key,
    required this.onRename,
    required this.onDelete,
    required this.onShare,
    required this.contextPath,
    required this.goBack,
    required this.contextName,
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
                onTap: () => _showRenameDialog(context),
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
                onTap: () => _showConfirmDeletionDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showConfirmDeletionDialog(final BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) => ConfirmationDialog(
              onConfirm: () => _onDelete(contextPath),
              onCancel: () => _onCancel(),
              header: 'Confirm Deletion',
              notificationText: 'Are you sure you want to delete this file?',
            ));
  }

  void _showRenameDialog(final BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) => CollectionRenameDialog(
              onSave: onRename,
              goBack: _onCancel,
              contextPath: contextPath,
              initialName: contextName,
            ));
  }

  void _onDelete(final String path) {
    onDelete(path);
    goBack();
    goBack();
  }

  void _onCancel() {
    goBack();
    goBack();
  }
}
