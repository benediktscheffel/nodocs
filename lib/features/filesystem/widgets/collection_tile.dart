import 'package:flutter/material.dart';

class CollectionTile extends StatefulWidget {
  final bool isPdf;
  final String title;
  final Widget dialog;
  final VoidCallback onTapPdf;
  final List<CollectionTile> children;

  @override
  State<CollectionTile> createState() => _CollectionTileState();

  const CollectionTile({
    super.key,
    required this.isPdf,
    required this.title,
    required this.dialog,
    required this.onTapPdf,
    required this.children,
  });
}

class _CollectionTileState extends State<CollectionTile> {
  bool _isExpanded = false;
  final List<CollectionTile> _children = <CollectionTile>[];

  _onLongPress(final BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (final BuildContext context) {
          return widget.dialog;
        });
  }

  @override
  Widget build(final BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.title,
              style: TextStyle(color: theme.colorScheme.onSecondary)),
          leading: Icon(
              widget.isPdf ? Icons.picture_as_pdf_outlined : Icons.folder_outlined,
              color: theme.colorScheme.onSecondary),
          onTap: widget.isPdf ? widget.onTapPdf : () => _toggleExpand(),
          onLongPress: () => _onLongPress(context),
          trailing: widget.isPdf
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
