import 'package:flutter/material.dart';

class CollectionChipDropdown extends StatelessWidget {
  final String pathName;

  const CollectionChipDropdown({super.key, required this.pathName});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 38,
      child: InputChip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(style: BorderStyle.none),
        ),
        label: IntrinsicWidth(
          child: Row(
            children: <Widget>[
              Text(
                pathName,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.colorScheme.onTertiaryContainer,
                ),
              ),
            ],
          ),
        ),
        color: WidgetStateProperty.all<Color>(theme.colorScheme.tertiaryContainer),
        onPressed: () {},
      ),
    );
  }
}