import 'package:flutter/material.dart';

class NavigationBox extends StatelessWidget {
  final List<Widget> buttons;

  const NavigationBox({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.secondary,
      height: 80,
      child: Flex(
        direction: Axis.horizontal,
        children: buttons.map((button) => Expanded(child: button)).toList(),
      )
    );
  }
}