import 'package:flutter/material.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class ConfirmationDialog extends StatelessWidget {
  final String header;
  final String notificationText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.header,
    required this.notificationText,
  });

  @override
  Widget build(final BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DialogBox(
      headerText: header,
      body: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            notificationText,
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        ),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: Text(
              'Cancel',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
                fontSize: 14,
              ),
            ),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              'Confirm',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
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
