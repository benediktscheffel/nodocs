class Languages {
  static final Map<String, String> languages = <String, String>{
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

  static Map<String, String> getSortedLanguages() {
    return Map<String, String>.fromEntries(languages.entries.toList()
      ..sort((final MapEntry<String, String> e1,
              final MapEntry<String, String> e2) =>
          e1.value.compareTo(e2.value)));
  }
}
