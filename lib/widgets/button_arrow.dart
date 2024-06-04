import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ArrowButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IconButton(
      color: theme.colorScheme.onSecondary,
      icon: const Icon(Icons.arrow_right),
      onPressed: () {},
    );
  }
}