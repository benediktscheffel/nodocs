import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;
  final IconData leading;
  final Widget? trailing;

  const SettingsTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.leading,
    this.trailing,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 2),
      child: ListTile(
        title:
        Text(title, style: TextStyle(color: theme.colorScheme.onSecondary)),
        leading: Icon(leading, color: theme.colorScheme.onSecondary),
        onTap: onPressed,
        trailing: trailing,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}