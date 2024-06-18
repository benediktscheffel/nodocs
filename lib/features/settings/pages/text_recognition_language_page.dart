import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/settings/widgets/settings_container.dart';
import 'package:nodocs/features/settings/widgets/settings_tile.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class TextRecognitionLanguagePage extends StatefulWidget {
  const TextRecognitionLanguagePage({super.key});

  @override
  State<StatefulWidget> createState() => _TextRecognitionLanguagePageState();
}

class _TextRecognitionLanguagePageState extends State<TextRecognitionLanguagePage> {
  String selectedLanguage = "en-US";
  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Map<String, String> languages = <String, String>{
      "da-DK": "Danish",
      "lt-LT": "Lithuanian",
      "sl-SI": "Slovene",
      "el-GR": "Greek (modern)",
      "ru-RU": "Russian",
      "en-US": "English (United States)",
      "zh-HK": "Chinese (Hong Kong)",
      "hu-HU": "Hungarian",
      "et-EE": "Estonian",
      "pt-BR": "Portuguese",
      "uk-UA": "Ukrainian",
      "nb-NO": "Norwegian Bokmål",
      "pl-PL": "Polish",
      "lv-LV": "Latvian",
      "fi-FI": "Finnish",
      "ja-JP": "Japanese",
      "es-ES": "Spanish",
      "bg-BG": "Bulgarian",
      "en-GB": "English (United Kingdom)",
      "cs-CZ": "Czech",
      "mt-MT": "Maltese",
      "de-DE": "German (Germany)",
      "hr-HR": "Croatian",
      "sk-SK": "Slovak",
      "sr-SR": "Serbian",
      "ca-CA": "Catalan",
      "mk-MK": "Macedonian",
      "ko-KR": "Korean",
      "de-CH": "German (Switzerland)",
      "nl-NL": "Dutch",
      "zh-CN": "Chinese (China)",
      "sv-SE": "Swedish",
      "it-IT": "Italian",
      "no-NO": "Norwegian",
      "tr-TR": "Turkish",
      "fr-FR": "French",
      "ro-RO": "Romanian",
    };
    final Map<String, String> sortedLanguages = Map<String, String>.fromEntries(
        languages.entries.toList()
          ..sort((final MapEntry<String, String> e1,
                  final MapEntry<String, String> e2) =>
              e1.value.compareTo(e2.value)));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: TitleWithButton(
          title: 'Text recognition language',
          icon: Icons.arrow_back_ios,
          onButtonClick: () {
            GoRouter.of(context).go(NavigationServiceRoutes.settings);
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
              collectionItems: sortedLanguages.entries.map((final MapEntry<String, String> entry) =>
                SettingsTile(
                  title: entry.value,
                  onPressed: () {
                    // TODO Save entry key globally for text recognition
                    setState(() {
                      selectedLanguage = entry.key;
                    });
                  },
                  leading: Icons.language_outlined,
                  trailing: selectedLanguage == entry.key ? Icon(
                    Icons.check_circle,
                    color: theme.colorScheme.onSecondary,
                  ): null,
                ),
              ).toList()
            ),
          ],
        ),
      ),
    );
  }
}