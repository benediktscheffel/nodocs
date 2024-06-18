import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/settings/widgets/settings_container.dart';
import 'package:nodocs/features/settings/widgets/settings_tile.dart';
import 'package:nodocs/widgets/button_switch.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: TitleWithButton(
          title: 'Settings',
          icon: Icons.arrow_back_ios,
          onButtonClick: () {
            GoRouter.of(context).go(NavigationServiceRoutes.home);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SettingsContainer(
              collectionItems: <SettingsTile>[
                SettingsTile(
                  title: 'Run text recognition',
                  onPressed: () {},
                  leading: Icons.text_snippet_outlined,
                  trailing: SwitchButton(
                    onChanged: (final bool value) {},
                  ),
                ),
                SettingsTile(
                  title: 'Text recognition language',
                  onPressed: () {
                    GoRouter.of(context).go(NavigationServiceRoutes.ocrLanguage);
                  },
                  leading: Icons.language_outlined,
                  trailing: Icon(
                    Icons.arrow_right_outlined,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            SettingsContainer(
              collectionItems: <SettingsTile>[
                SettingsTile(
                  title: 'DarkMode',
                  onPressed: () {},
                  leading: Icons.dark_mode_outlined,
                  trailing: SwitchButton(
                    onChanged: (final bool value) {},
                  ),
                ),
                SettingsTile(
                  title: 'Text size',
                  onPressed: () {},
                  leading: Icons.text_fields_outlined,
                  trailing: Icon(
                      Icons.arrow_right_outlined,
                      color: theme.colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}