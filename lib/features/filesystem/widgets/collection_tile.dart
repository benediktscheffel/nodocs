import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/collection_tile_dialog.dart';



class CollectionTile extends StatefulWidget {
  final String title;
  final IconData leading;
  final String path;

  const CollectionTile({
    required this.title,
    required this.leading,
    required this.path,
    super.key,
  });

  @override
  State<CollectionTile> createState() => _CollectionTileState();
}

class _CollectionTileState extends State<CollectionTile> {
  bool _isExpanded = false;
  List<CollectionTile> _children = <CollectionTile>[];

  _onLongPress(final BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (final BuildContext context) {
        return CollectionTileDialog(
              onRename: () {},
              onDelete: () {},
              onShare: () {},

          );
      }
    );
  }

  @override
  Widget build(final BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDirectory = FileSystemEntity.typeSync(widget.path) == FileSystemEntityType.directory;
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.title, style: TextStyle(color: theme.colorScheme.onSecondary)),
          leading: Icon(widget.leading, color: theme.colorScheme.onSecondary),
          onTap: isDirectory ? _toggleExpand : () {
            PdfViewerRoute(path: widget.path).go(context);
          },
          onLongPress: () => _onLongPress(context),
          trailing: isDirectory ? Icon(_isExpanded ? Icons.arrow_drop_down : Icons.arrow_right, color: theme.colorScheme.onSecondary) : null,
        ),
        if (_isExpanded) ..._children.map((final CollectionTile child) => Padding(
          padding: const EdgeInsets.only(left: 16.0), // Add left padding to the children items
          child: child,
        ))
      ],
    );
  }
  void _toggleExpand() {
    if (_children.isEmpty) {
      _listItems();
    } else {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    }
  }

  Future<void> _listItems() async {
    final Directory directory = Directory(widget.path);
    final List<CollectionTile> items = <CollectionTile>[];

    try {
      final List<FileSystemEntity> entities = directory.listSync();
      for (FileSystemEntity entity in entities) {
        if (entity is Directory) {
          items.add(CollectionTile(
            title: entity.path.split('/').last,
            leading: Icons.folder,
            path: entity.path,
          ));
        }
        if (entity is File && entity.path.endsWith('.pdf')) {
          items.add(CollectionTile(
            title: entity.path.split('/').last.replaceAll('.pdf', ''),
            leading: Icons.picture_as_pdf_outlined,
            path: entity.path,
          ));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error listing directories: $e');
      }
    }

    setState(() {
      _children = items;
      _isExpanded = true;
    });
  }
}