import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String headerText;
  final List<Widget> body;
  final Widget footer;

  const DialogBox(
      {super.key,
      required this.body,
      required this.headerText,
      required this.footer});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Dialog(
      backgroundColor: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(headerText, style: const TextStyle(fontSize: 24))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: body,
              ),
            ),
            footer,
          ],
        ),
      ),
    );
  }
}
