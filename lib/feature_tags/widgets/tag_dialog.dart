import 'package:flutter/material.dart';
import 'package:nodocs/feature_tags/widgets/tag_chip_container.dart';
import 'package:nodocs/feature_tags/widgets/tag_input.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class TagDialog extends StatelessWidget {
  const TagDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Edit Tags', style: TextStyle(fontSize: 24),),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TagChipContainer(
              tagData: [("Tag1", true),  ("Tag2", false), ("Tag3", false), ("Tag4", false), ("Tag5", true)]
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TagInput(),
        ),
        TextButton(
          onPressed: () {
            // TODO update Database
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Save',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /*void showTagDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => const TagDialog(),
    );
  }*/
}
