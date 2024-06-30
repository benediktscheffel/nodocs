import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/settings/controller/implementation/settings_providers.dart';
import 'package:nodocs/features/settings/controller/settings_controller.dart';
import 'package:nodocs/features/settings/model/settings_model.dart';
import 'package:nodocs/features/settings/widgets/settings_container.dart';
import 'package:nodocs/features/settings/widgets/settings_tile.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/widgets/button_switch.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final SettingsController controller = ref.read(settingsControllerProvider);
    final SettingsModel model = ref.watch(settingsModelProvider);
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: TitleWithButton(
          title: LocaleKeys.settings_title.tr(),
          icon: Icons.arrow_back_ios,
          onButtonClick: () =>
              controller.goBack(Uri(path: NavigationServiceRoutes.home)),
        ),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SettingsContainer(
            collectionItems: <SettingsTile>[
              SettingsTile(
                title: LocaleKeys.settings_ocr_run_text_recognition.tr(),
                onPressed: () {},
                leading: Icons.text_snippet_outlined,
                trailing: SwitchButton(
                  value: false,
                  onChanged: (final bool value) {},
                ),
              ),
              SettingsTile(
                title: LocaleKeys.settings_ocr_text_recognition_language.tr(),
                onPressed: () {
                  controller
                      .goToPage(Uri(path: NavigationServiceRoutes.ocrLanguage));
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
                title: LocaleKeys.settings_appearance_dark_mode.tr(),
                onPressed: () {},
                leading: Icons.dark_mode_outlined,
                trailing: SwitchButton(
                  value: model.settings.darkMode,
                  // change ThemeData to darkMode if darkMode is true

                  onChanged: (final bool value) {
                    controller.toggleDarkMode();
                  },
                ),
              ),
              SettingsTile(
                title: LocaleKeys.settings_appearance_text_size.tr(),
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
    );
  }
}
