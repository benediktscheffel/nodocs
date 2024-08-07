import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

class CollectionTileDialog extends StatelessWidget {
  final String contextPath;
  final VoidCallback onShare;
  final VoidCallback onAdd;
  final Widget deleteDialog;
  final Widget renameDialog;

  const CollectionTileDialog({
    super.key,
    required this.onShare,
    required this.contextPath,
    required this.deleteDialog,
    required this.renameDialog,
    required this.onAdd,
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
            children: _buildListTiles(context, colorScheme),
          ),
        ),
      ),
    );
  }

  _showConfirmDeletionDialog(final BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) => deleteDialog);
  }

  void _showRenameDialog(final BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) => renameDialog);
  }

  List<Widget> _buildListTiles(
      final BuildContext context, final ColorScheme colorScheme) {
    List<Widget> listTiles = <Widget>[
      ListTile(
        trailing: Icon(Icons.edit, color: colorScheme.onPrimary),
        title: Text(LocaleKeys.home_collection_tile_rename.tr(),
            style: TextStyle(color: colorScheme.onPrimary)),
        onTap: () => _showRenameDialog(context),
      ),
      ListTile(
        trailing: Icon(Icons.ios_share_sharp, color: colorScheme.onPrimary),
        title: Text(LocaleKeys.home_collection_tile_share.tr(),
            style: TextStyle(color: colorScheme.onPrimary)),
        onTap: onShare,
      ),
    ];

    if (!contextPath.endsWith('.pdf')) {
      listTiles.add(
        ListTile(
          trailing:
              Icon(Icons.upload_file_outlined, color: colorScheme.onPrimary),
          title: Text(LocaleKeys.home_collection_tile_upload.tr(),
              style: TextStyle(color: colorScheme.onPrimary)),
          onTap: onAdd,
        ),
      );
    }
    listTiles.addAll(
      <Widget>[
        Divider(
          color: colorScheme.onPrimary,
          height: 1,
          thickness: 2,
        ),
        ListTile(
          trailing: const Icon(Icons.delete, color: Colors.redAccent),
          title: Text(LocaleKeys.home_collection_tile_delete.tr(),
              style: const TextStyle(color: Colors.redAccent)),
          onTap: () => _showConfirmDeletionDialog(context),
        ),
      ],
    );
    return listTiles;
  }
}
