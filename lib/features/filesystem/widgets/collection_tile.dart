import 'package:flutter/material.dart';
import 'package:nodocs/widgets/collection_tile_dialog.dart';

class CollectionTile extends StatefulWidget {
  final String title;
  final IconData leading;
  final String path;
  final List<CollectionTile> children;
  final VoidCallback onTapPdf;
  final VoidCallback goBack;
  final Function(String) onDelete;
  final Function(String, String) onRename;

  @override
  State<CollectionTile> createState() => _CollectionTileState();

  const CollectionTile({
    required this.title,
    required this.leading,
    required this.path,
    required this.children,
    required this.onDelete,
    required this.onTapPdf,
    required this.onRename,
    required this.goBack,
    super.key,
  });
}

class _CollectionTileState extends State<CollectionTile> {
  bool _isExpanded = false;
  final List<CollectionTile> _children = <CollectionTile>[];

  _onLongPress(final BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (final BuildContext context) {
          return CollectionTileDialog(
            contextName: widget.title,
            goBack: widget.goBack,
            contextPath: widget.path,
            onRename: widget.onRename,
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
          onTap: isPdf ? widget.onTapPdf : () => _toggleExpand(),
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
