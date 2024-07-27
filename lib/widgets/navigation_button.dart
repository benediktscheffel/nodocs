import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final IconData buttonIcon;
  final String buttonText;
  final VoidCallback onPressed;

  const NavigationButton({
    super.key,
    required this.buttonText,
    required this.buttonIcon,
    required this.onPressed,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        ElevatedButton(
          onPressed: () { onPressed(); },
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (final Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return theme.colorScheme.primary.withOpacity(0.4);
                }
                return theme.colorScheme.primary;
              }
            ),
            minimumSize: WidgetStateProperty.all<Size>(Size(theme.buttonTheme.minWidth, theme.buttonTheme.height)),
            maximumSize: WidgetStateProperty.all<Size>(Size(theme.buttonTheme.minWidth, theme.buttonTheme.height)),
            elevation: WidgetStateProperty.all<double>(0),
          ),
          child: Icon(
            buttonIcon,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        Text(buttonText, style:
          TextStyle(
            color: theme.colorScheme.onSecondary,
            fontSize: theme.textTheme.labelSmall!.fontSize,
            height: 0,
          ),
        ),
      ])
    );
  }
}