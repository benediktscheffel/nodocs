import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_input.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class CollectionRenameDialog extends StatelessWidget {
  final Function(String) onSave;
  final VoidCallback goBack;
  final TextEditingController controller;

  CollectionRenameDialog(
      {super.key,
      required this.onSave,
      required this.goBack,
      required final String initialText,
      })
      : controller = TextEditingController(text: initialText)
          ..selection =
              TextSelection(baseOffset: 0, extentOffset: initialText.length);

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      headerText: 'Rename',
      body: <Widget>[
        CollectionInput(
          hintText: 'Rename Collection/File',
          controller: controller,
        ),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: goBack,
            child: Text(
              'Cancel',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer,
                fontSize: 14,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _onSave(controller.text),
            child: Text(
              'Confirm',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onSave(final String name) {
    if (name.isNotEmpty) {
      onSave(name);
    }
    goBack();
  }
}
