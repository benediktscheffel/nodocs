import 'package:flutter/material.dart';

abstract class LanguageEvaluationService {
  Locale getSupportedLanguage(final String languageCode);
}
