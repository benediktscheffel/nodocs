import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_input.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/dialog_box.dart';


class CollectionCreateDialog extends StatelessWidget {
  final Function(String) onSave;
  final TextEditingController controller = TextEditingController();

  CollectionCreateDialog({super.key, required this.onSave});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      headerText: 'Create a new Collection',
      body: <Widget>[
          CollectionInput(controller: controller),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () {


              const HomeRoute().go(context);
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
              // onSave();
              onSave(controller.text);
              const HomeRoute().go(context);
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
