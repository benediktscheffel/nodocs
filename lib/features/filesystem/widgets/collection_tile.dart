import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/collection_tile_dialog.dart';

class CollectionTile extends StatefulWidget {
  final String title;
  final IconData leading;
  final String path;
  final List<CollectionTile> children;
  final Function(String) onDelete;

  const CollectionTile(
      {required this.title,
      required this.leading,
      required this.path,
      required this.children,
      required this.onDelete,
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
            contextPath: widget.path,
            onRename: () {},
            // TODO: add confirmation dialog
            onDelete: widget.onDelete,
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
          onTap: isPdf
              ? () => PdfViewerRoute(path: widget.path).go(context)
              : () => _toggleExpand(),
          onLongPress: () => _onLongPress(context),
          trailing: isPdf
              ? null
              : Icon(_isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: theme.colorScheme.onSecondary),
        ),
        if (_isExpanded)
          ...widget.children.map((final CollectionTile child) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: child,
              ))
      ],
    );
  }


  void _toggleExpand() {
    if (_children.isEmpty) {
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
