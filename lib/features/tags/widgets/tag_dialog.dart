import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nodocs/features/tags/widgets/tag_chip_container.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class TagDialog extends StatelessWidget {
  final TagChipContainer tagChipContainer;
  final VoidCallback goBack;
  final Function(List<String>) saveTags;

  const TagDialog({
    super.key,
    required this.tagChipContainer,
    required this.goBack,
    required this.saveTags,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      headerText: 'Edit Tags',
      body: <Widget>[
        tagChipContainer,
      ],
      footer: TextButton(
        onPressed: () {
          saveTags(tagChipContainer.tagData
              .filter((final (String, bool) tag) => tag.$2 == true)
              .map((final (String, bool) tag) => tag.$1)
              .toList());
          goBack();
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Save',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
