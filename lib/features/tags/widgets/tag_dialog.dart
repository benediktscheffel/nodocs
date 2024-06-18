import 'package:flutter/material.dart';
import 'package:nodocs/features/tags/widgets/tag_chip_container.dart';
import 'package:nodocs/features/tags/widgets/tag_input.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class TagDialog extends StatelessWidget {
  const TagDialog({super.key});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      headerText: 'Edit Tags',
      body: const <Widget>[
        TagChipContainer(tagData: <(String, bool)>[
          ("Tag1", true),
          ("Tag2", false),
          ("Tag3", false),
          ("Tag4", false),
          ("Tag5", true)
        ]),
        TagInput(),
      ],
      footer: TextButton(
        onPressed: () {
          // TODO update Database
          Navigator.pop(context);
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
