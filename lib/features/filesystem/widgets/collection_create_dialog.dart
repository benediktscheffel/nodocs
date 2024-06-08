import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_input.dart';
import 'package:nodocs/widgets/dialog_box.dart';


class CollectionCreateDialog extends StatelessWidget {
  const CollectionCreateDialog({super.key});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      headerText: 'Create a new Collection',
      body: const <Widget>[
          CollectionInput(),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
            onPressed: () {
              // TODO add to Collections
              Navigator.pop(context);
            },
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
}
