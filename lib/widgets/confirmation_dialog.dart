import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class ConfirmationDialog extends StatelessWidget {
  final String header;
  final String notificationText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String? cancelText;
  final String? confirmText;

  const ConfirmationDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.header,
    required this.notificationText,
    this.cancelText,
    this.confirmText,
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
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onPrimary
            ),
          ),
        ),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: Text(
              cancelText == null ? LocaleKeys.general_confirmation_dialog_cancel.tr() : cancelText!,
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
              confirmText == null ? LocaleKeys.general_confirmation_dialog_confirm.tr() : confirmText!,
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
