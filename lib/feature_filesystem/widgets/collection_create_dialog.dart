import 'package:flutter/material.dart';
import 'package:nodocs/feature_filesystem/widgets/collection_input.dart';

import '../../widgets/dialog_box.dart';

class CollectionCreateDialog extends StatelessWidget {
  const CollectionCreateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Create a new Collection',
            style: TextStyle(fontSize: 24),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CollectionInput(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
      ],
    );
  }
}
