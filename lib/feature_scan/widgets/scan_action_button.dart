import 'package:flutter/material.dart';

class ScanActionButton extends StatelessWidget {
  final IconData buttonIcon;
  final String buttonText;
  final VoidCallback onPressed;

  const ScanActionButton({
    super.key,
    required this.buttonIcon,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ButtonStyle(
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (final Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return theme.colorScheme.secondary.withOpacity(0.4);
              }
              return theme.colorScheme.secondary;
            }),
            minimumSize: WidgetStateProperty.all<Size>(const Size(56, 56)),
            maximumSize: WidgetStateProperty.all<Size>(const Size(56, 56)),
          ),
          child: Icon(
            buttonIcon,
            color: theme.colorScheme.onSecondary,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          buttonText,
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
