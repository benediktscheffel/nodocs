import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const SwitchButton({super.key, required this.onChanged});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _value = false;

  @override
  Widget build(final BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Switch(
      value: _value,
      onChanged: (final bool value) {
        setState(() {
          _value = value;
        });
        widget.onChanged(value);
      },
      activeColor: colorScheme.onSecondary,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.white,

    );
  }
}
