import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nodocs/config/config_parameters.dart';
import 'package:nodocs/features/settings/services/language/language_evaluation_service.dart';

class LanguageEvaluationServiceImpl extends LanguageEvaluationService {
  @override
  Locale getSupportedLanguage(final String languageCode) {
    List<Locale> locales = ConfigParameters.supportedLocales
        .filter((final Locale l) => l.languageCode == languageCode)
        .toList();
    if (locales.isEmpty) {
      return ConfigParameters.fallbackLocale;
    }
    return locales.first;
  }
}
