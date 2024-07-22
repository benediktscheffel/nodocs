import 'package:flutter/material.dart';

class NavigationBox extends StatelessWidget {
  final List<Widget> buttons;

  const NavigationBox({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: theme.colorScheme.secondary,
      height: size.height * 0.09,
      child: Flex(
        direction: Axis.horizontal,
        children: buttons.map((final Widget button) => Expanded(child: button)).toList(),
      )
    );
  }
}