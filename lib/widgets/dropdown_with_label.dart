import 'package:flutter/material.dart';

class DropdownWithLabel extends StatelessWidget {
  final Widget dropdown;
  final String label;

  const DropdownWithLabel({super.key, required this.dropdown, required this.label});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 14,
          ),
        ),
        SizedBox(height: size.height * 0.0082,),
        dropdown,
      ],
    );
  }
}