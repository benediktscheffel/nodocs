import 'package:flutter/material.dart';

class TitleWithButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onButtonClick;

  const TitleWithButton({super.key, required this.title, required this.icon, required this.onButtonClick});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 42,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: -4.5,
          child: IconButton(
            onPressed: onButtonClick,
            icon: Icon(
              icon,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}