import 'package:nodocs/features/navigation/implementation/go_router_navigation_service.dart';
import 'package:nodocs/features/navigation/navigation_service.dart';
import 'package:nodocs/features/settings/controller/settings_controller.dart';
import 'package:nodocs/features/settings/controller/text_recognition_language_controller.dart';
import 'package:nodocs/features/settings/model/settings_model.dart';
import 'package:nodocs/features/settings/model/text_recognition_language_model.dart';
import 'package:nodocs/features/settings/services/persistence/implementation/settings_shared_preferences_persistence_service.dart';
import 'package:nodocs/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'settings_controller_impl.dart';
import 'text_recognition_language_contoller_impl.dart';

part 'settings_providers.g.dart';

@riverpod
NavigationService settingsNavigationService(
        final SettingsNavigationServiceRef ref) =>
    GoRouterNavigationService(goRouter: ref.read(goRouterProvider));

@riverpod
SettingsController settingsController(final SettingsControllerRef ref) =>
    ref.watch(
      settingsControllerImplProvider(
        settingsPersistenceService:
            ref.watch(settingsPersistenceServiceProvider),
        navigationService: ref.watch(settingsNavigationServiceProvider),
      ).notifier,
    );

@riverpod
SettingsModel settingsModel(final SettingsModelRef ref) =>
    ref.watch(settingsControllerImplProvider(
      settingsPersistenceService: ref.watch(settingsPersistenceServiceProvider),
      navigationService: ref.watch(settingsNavigationServiceProvider),
    ));

@riverpod
TextRecognitionLanguageController textRecognitionLanguageController(
        final TextRecognitionLanguageControllerRef ref) =>
    ref.watch(
      textRecognitionLanguageContollerImplProvider(
        settingsPersistenceService:
            ref.watch(settingsPersistenceServiceProvider),
        navigationService: ref.watch(settingsNavigationServiceProvider),
      ).notifier,
    );

@riverpod
TextRecognitionLanguageModel textRecognitionLanguageModel(
        final TextRecognitionLanguageModelRef ref) =>
    ref.watch(textRecognitionLanguageContollerImplProvider(
      settingsPersistenceService: ref.watch(settingsPersistenceServiceProvider),
      navigationService: ref.watch(settingsNavigationServiceProvider),
    ));
