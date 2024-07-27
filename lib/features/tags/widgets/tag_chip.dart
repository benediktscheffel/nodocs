import 'package:flutter/material.dart';

class TagChip extends StatefulWidget {
  final bool tagState;
  final String tagName;
  final ValueChanged<bool> onSelected;
  final double heightOfParent;

  const TagChip({
    super.key,
    required this.tagState,
    required this.tagName,
    required this.onSelected,
    required this.heightOfParent,
  });

  @override
  TagChipState createState() => TagChipState();
}

class TagChipState extends State<TagChip> {
  late bool _tagState;

  @override
  void initState() {
    super.initState();
    _tagState = widget.tagState;
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 0.476 * widget.heightOfParent,
      child: InputChip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(style: BorderStyle.none),
        ),
        showCheckmark: false,
        label: _tagState
            ? IntrinsicWidth(
                child: Row(children: <Widget>[
                Text(
                  "# ",
                  style:
                      TextStyle(fontSize: theme.textTheme.bodySmall!.fontSize),
                ),
                Text(
                  widget.tagName,
                  style:  TextStyle(fontSize: theme.textTheme.bodySmall!.fontSize),
                )
              ]))
            : IntrinsicWidth(
                child: Row(children: <Widget>[
                Icon(
                  Icons.add_outlined,
                  size: 0.274 * widget.heightOfParent,
                ),
                Text(
                  widget.tagName,
                  style: TextStyle(fontSize: theme.textTheme.bodySmall!.fontSize),
                )
              ])),
        onSelected: (final bool _) {
          setState(() {
            _tagState = !_tagState;
          });
          widget.onSelected(_tagState);
        },
        selected: _tagState,
        color: _tagState
            ? WidgetStateProperty.all<Color>(theme.colorScheme.secondary)
            : WidgetStateProperty.all<Color>(theme.colorScheme.tertiary),
        deleteIcon: _tagState
            ? Icon(
                Icons.close,
                size: 0.238 * widget.heightOfParent,
              )
            : null,
        onDeleted: _tagState ? () {} : null,
      ),
    );
  }
}
