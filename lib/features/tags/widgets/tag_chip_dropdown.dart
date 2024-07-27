import 'package:flutter/material.dart';

class TagChipDropdown extends StatelessWidget {

  final String tagName;
  final VoidCallback onRemove;

  const TagChipDropdown({super.key, required this.tagName, required this.onRemove});


  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return LayoutBuilder(builder: (final BuildContext context, final BoxConstraints constraints) {
      return SizedBox(
        height: constraints.maxHeight * 0.76,
        child: InputChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: const BorderSide(style: BorderStyle.none),
          ),
          label: IntrinsicWidth(
              child: Row(children: <Widget>[
                Text("# ",
                  style: TextStyle(
                    fontSize: theme.textTheme.bodySmall!.fontSize,
                    color: theme.colorScheme.onTertiaryContainer,
                  ),
                ),
                Text(
                  tagName,
                  style: TextStyle(
                    fontSize: theme.textTheme.bodySmall!.fontSize,
                    color: theme.colorScheme.onTertiaryContainer,
                  ),
                ),
              ])
          ),
          color:  WidgetStateProperty.all<Color>(theme.colorScheme.tertiaryContainer),
          deleteIcon: InkWell(
            onTap: onRemove,
            child: Icon(
              color: theme.colorScheme.onTertiaryContainer,
              Icons.highlight_remove_outlined,
              size: constraints.maxHeight * 0.36,
            ),
          ),
          onDeleted: () {},
          onPressed: onRemove,
        ),
      );
    });
  }
}