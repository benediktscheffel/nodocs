import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/settings/controller/implementation/settings_providers.dart';
import 'package:nodocs/features/settings/controller/language_settings_controller.dart';
import 'package:nodocs/features/settings/model/language_settings_model.dart';
import 'package:nodocs/features/settings/widgets/settings_container.dart';
import 'package:nodocs/features/settings/widgets/settings_tile.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class LanguageSettingsPage extends ConsumerWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final LanguageSettingsController controller =
        ref.watch(languageSettingsControllerProvider);
    final LanguageSettingsModel model =
        ref.watch(languageSettingsModelProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: TitleWithButton(
          title: LocaleKeys.settings_app_language.tr(),
          icon: Icons.arrow_back_ios,
          onButtonClick: () {
            controller.goBack(Uri(path: NavigationServiceRoutes.settings));
          },
        ),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SettingsContainer(
              collectionItems: model.languages.entries
                  .map(
                    (final MapEntry<String, String> entry) => SettingsTile(
                      title: entry.value.tr(),
                      onPressed: () {
                        controller.setLanguage(entry.key, context);
                      },
                      leading: Icons.language_outlined,
                      trailing: model.selectedLanguageCode == entry.key
                          ? Icon(
                              Icons.check_circle,
                              color: theme.colorScheme.onSecondary,
                            )
                          : null,
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
