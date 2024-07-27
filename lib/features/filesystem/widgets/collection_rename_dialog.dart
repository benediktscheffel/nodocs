import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_input.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
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
      headerText: LocaleKeys.home_collection_tile_rename_dialog_header_text.tr(),
      body: <Widget>[
        CollectionInput(
          hintText: LocaleKeys.home_collection_tile_rename_dialog_hint_text.tr(),
          controller: controller,
        ),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: goBack,
            child: Text(
              LocaleKeys.home_collection_tile_rename_dialog_cancel.tr(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer,
                fontSize: theme.textTheme.bodySmall!.fontSize,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _onSave(controller.text),
            child: Text(
              LocaleKeys.home_collection_tile_rename_dialog_confirm.tr(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer,
                fontSize: theme.textTheme.bodySmall!.fontSize,
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
