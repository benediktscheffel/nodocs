import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_input.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class CollectionCreateDialog extends StatelessWidget {
  final Function(String) onSave;
  final VoidCallback goBack;
  final TextEditingController controller = TextEditingController();

  CollectionCreateDialog(
      {super.key, required this.onSave, required this.goBack});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      headerText: 'Create a new Collection',
      body: <Widget>[
        CollectionInput(
          hintText: 'New Collection',
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
              'Create',
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
