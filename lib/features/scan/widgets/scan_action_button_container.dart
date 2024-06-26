import 'package:flutter/material.dart';

class ScanActionButtonContainer extends StatelessWidget {
  final List<Widget> buttons;

  const ScanActionButtonContainer({super.key, required this.buttons});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(buttons.length * 2 - 1, (final int index) {
        if (index.isEven) {
          return buttons[index ~/ 2];
        } else {
          return SizedBox(
            height: 70,
            child: VerticalDivider(
              color: theme.colorScheme.secondary,
              thickness: 1.0,
              width: 30,
              indent: 0,
              endIndent: 22,
            ),
          );
        }
      }),
    );
  }
}
