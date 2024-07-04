import 'package:flutter/material.dart';

abstract class LanguageSettingsController {
  void setLanguage(final String language, final BuildContext context);
  void goBack(final Uri? uri);
}