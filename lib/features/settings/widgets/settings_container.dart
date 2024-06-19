import 'package:flutter/material.dart';
import 'package:nodocs/features/settings/widgets/settings_tile.dart';

class SettingsContainer extends StatelessWidget {
  final List<SettingsTile> collectionItems;

  const SettingsContainer({
    super.key,
    required this.collectionItems,
  });

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(23),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: collectionItems,
          ),
        ),
      ),
    );
  }
}
