import 'package:nodocs/gen/locale_keys.g.dart';

class Languages {
  static final Map<String, String> appLanguages = <String, String>{
    "de-DE": "Deutsch",
    "en-US": "English",

  };

  static final Map<String, String> languages = <String, String>{
    "da-DK": LocaleKeys.settings_ocr_languages_daDK,
    "lt-LT": LocaleKeys.settings_ocr_languages_ltLT,
    "sl-SI": LocaleKeys.settings_ocr_languages_slSI,
    "el-GR": LocaleKeys.settings_ocr_languages_elGR,
    "ru-RU": LocaleKeys.settings_ocr_languages_ruRU,
    "en-US": LocaleKeys.settings_ocr_languages_enUS,
    "zh-HK": LocaleKeys.settings_ocr_languages_zhHK,
    "hu-HU": LocaleKeys.settings_ocr_languages_huHU,
    "et-EE": LocaleKeys.settings_ocr_languages_etEE,
    "pt-BR": LocaleKeys.settings_ocr_languages_ptBR,
    "uk-UA": LocaleKeys.settings_ocr_languages_ukUA,
    "nb-NO": LocaleKeys.settings_ocr_languages_nbNO,
    "pl-PL": LocaleKeys.settings_ocr_languages_plPL,
    "lv-LV": LocaleKeys.settings_ocr_languages_lvLV,
    "fi-FI": LocaleKeys.settings_ocr_languages_fiFI,
    "ja-JP": LocaleKeys.settings_ocr_languages_jaJP,
    "es-ES": LocaleKeys.settings_ocr_languages_esES,
    "bg-BG": LocaleKeys.settings_ocr_languages_bgBG,
    "en-GB": LocaleKeys.settings_ocr_languages_enGB,
    "cs-CZ": LocaleKeys.settings_ocr_languages_csCZ,
    "mt-MT": LocaleKeys.settings_ocr_languages_mtMT,
    "de-DE": LocaleKeys.settings_ocr_languages_deDE,
    "hr-HR": LocaleKeys.settings_ocr_languages_hrHR,
    "sk-SK": LocaleKeys.settings_ocr_languages_skSK,
    "sr-SR": LocaleKeys.settings_ocr_languages_srSR,
    "ca-CA": LocaleKeys.settings_ocr_languages_caCA,
    "mk-MK": LocaleKeys.settings_ocr_languages_mkMK,
    "ko-KR": LocaleKeys.settings_ocr_languages_koKR,
    "de-CH": LocaleKeys.settings_ocr_languages_deCH,
    "nl-NL": LocaleKeys.settings_ocr_languages_nlNL,
    "zh-CN": LocaleKeys.settings_ocr_languages_zhCN,
    "sv-SE": LocaleKeys.settings_ocr_languages_svSE,
    "it-IT": LocaleKeys.settings_ocr_languages_itIT,
    "no-NO": LocaleKeys.settings_ocr_languages_noNO,
    "tr-TR": LocaleKeys.settings_ocr_languages_trTR,
    "fr-FR": LocaleKeys.settings_ocr_languages_frFR,
    "ro-RO": LocaleKeys.settings_ocr_languages_roRO
  };

  static Map<String, String> getSortedOCRLanguages() {
    return Map<String, String>.fromEntries(languages.entries.toList()
      ..sort((final MapEntry<String, String> e1,
              final MapEntry<String, String> e2) =>
          e1.value.compareTo(e2.value)));
  }

  static Map<String, String> getSortedAppLanguages() {
    return Map<String, String>.fromEntries(appLanguages.entries.toList()
      ..sort((final MapEntry<String, String> e1,
              final MapEntry<String, String> e2) =>
          e1.value.compareTo(e2.value)));
  }
}
