import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/features/tags/widgets/tag_chip_container.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/widgets/dialog_box.dart';

class TagDialog extends StatelessWidget {
  final TagChipContainer tagChipContainer;
  final VoidCallback goBack;
  final Function(List<(String, bool)>) saveTags;

  const TagDialog({
    super.key,
    required this.tagChipContainer,
    required this.goBack,
    required this.saveTags,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DialogBox(
      headerText: LocaleKeys.pdf_viewer_tags_dialog_header.tr(),
      body: <Widget>[
        tagChipContainer,
      ],
      footer: TextButton(
        onPressed: () {
          saveTags(tagChipContainer.tagData);
          goBack();
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                LocaleKeys.pdf_viewer_tags_dialog_save.tr(),
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontSize: theme.textTheme.bodySmall!.fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
