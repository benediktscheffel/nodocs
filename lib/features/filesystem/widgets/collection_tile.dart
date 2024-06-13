
import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/model/collection_node/collection_node.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/collection_tile_dialog.dart';

class CollectionTile extends StatefulWidget {
  final String title;
  final IconData leading;
  final String path;
  final List<CollectionNode> nodes;

  const CollectionTile(
      {required this.title,
      required this.leading,
      required this.path,
      required this.nodes,
      super.key});

  @override
  State<CollectionTile> createState() => _CollectionTileState();
}

class _CollectionTileState extends State<CollectionTile> {
  bool _isExpanded = false;
  final List<CollectionTile> _children = <CollectionTile>[];

  _onLongPress(final BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (final BuildContext context) {
          return CollectionTileDialog(
            onRename: () {},
            onDelete: () {},
            onShare: () {},
          );
        });
  }

  @override
  Widget build(final BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isPdf = widget.path.endsWith('.pdf');
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.title,
              style: TextStyle(color: theme.colorScheme.onSecondary)),
          leading: Icon(widget.leading, color: theme.colorScheme.onSecondary),
          onTap: isPdf ? () => PdfViewerRoute(path: widget.path).go(context)
              : () => _toggleExpand(),
          onLongPress: () => _onLongPress(context),
          trailing: isPdf
              ? null
              : Icon(_isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: theme.colorScheme.onSecondary),
        ),
        if (_isExpanded)
          ..._children.map((final CollectionTile child) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: child,
              ))
      ],
    );
  }

  void _listItems() {
    _children.addAll(widget.nodes.map((final CollectionNode node) {
      final bool isPdf = node.path.endsWith('.pdf');
      return CollectionTile(
        title: node.displayName,
        leading: isPdf ? Icons.picture_as_pdf_outlined : Icons.folder_outlined,
        path: node.path,
        nodes: node.children,
      );
    }).toList());
  }

  void _toggleExpand() {
    if (_children.isEmpty) {
      _listItems();
      setState(() {
        _isExpanded = !_isExpanded;
      });
    } else {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    }
  }
}
