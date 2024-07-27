import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

class ScanOcrLoadingDialog extends StatelessWidget  {
  const ScanOcrLoadingDialog({super.key});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Dialog.fullscreen(
      backgroundColor: theme.colorScheme.primary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              LocaleKeys.save_ocr_loading_dialog_header.tr(),
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: theme.textTheme.headlineMedium!.fontSize,
              ),
            ),
            CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
            ),
            Text(
              LocaleKeys.save_ocr_loading_dialog_stay_connected.tr(),
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: theme.textTheme.bodyMedium!.fontSize,
              ),
            ),
          ],
        )
      ),
    );
  }
}