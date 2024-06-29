import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/settings/controller/implementation/settings_providers.dart';
import 'package:nodocs/features/settings/model/settings_model.dart';
import 'package:nodocs/features/tags/services/persistence/isar/isar_persistence_service.dart';
import 'package:nodocs/widgets/themes.dart';
import 'config/service_locator.dart';
import 'features/settings/services/persistence/implementation/settings_shared_preferences_persistence_service.dart';
import 'go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  final ProviderContainer providerContainer = ProviderContainer();
  await providerContainer.read(persistenceServiceProvider).init();
  await providerContainer.read(settingsPersistenceServiceProvider).init();

  await dotenv.load(fileName: "config.env");

  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    SettingsModel settingsController = ref.watch(settingsModelProvider);
    bool darkMode = settingsController.settings.darkMode;
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'NoDocs',
      theme: darkMode ? Themes.dark : Themes.light,
    );
  }
}
