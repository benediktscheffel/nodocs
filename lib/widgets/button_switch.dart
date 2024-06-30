import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  const SwitchButton({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool _value;

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

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }
}
