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
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Dialog(
      backgroundColor: theme.colorScheme.primary,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  headerText,
                  style: TextStyle(
                    fontSize: theme.textTheme.headlineMedium!.fontSize,
                  ),
                ),
              ),
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
      ),
    );
  }
}
