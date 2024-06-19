import 'package:flutter/material.dart';

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
              'Please wait a moment...',
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 24,
              ),
            ),
            CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
            ),
            Text(
              'Please stay connected to the internet\nuntil the document has been processed.',
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
          ],
        )
      ),
    );
  }
}