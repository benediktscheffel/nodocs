import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nodocs/features/settings/controller/implementation/settings_providers.dart';
import 'package:nodocs/features/settings/model/settings_model.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/util/logging/log.dart';
import 'package:nodocs/widgets/image_with_loading.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/widgets/themes.dart';
import 'package:nodocs/widgets/title_with_button.dart';

class ErrorHandler extends ConsumerStatefulWidget {
  final Widget child;

  const ErrorHandler({super.key, required this.child});

  @override
  ConsumerState<ErrorHandler> createState() => _ErrorHandlerWidgetState();
}

class _ErrorHandlerWidgetState extends ConsumerState<ErrorHandler> {
  final Logger _log = getLogger();
  bool errorOccurred = false;
  String errorMessage = '';
  void onError(final FlutterErrorDetails errorDetails) {
    _log.e('Caught error: $errorDetails');
    Future<void>.microtask(() {
      if (mounted) {
        setState(() {
          errorMessage = errorDetails.exceptionAsString().replaceFirst('Exception: ', '');
          errorOccurred = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    FlutterError.onError = onError;
  }

  @override
  Widget build(final BuildContext context) {
    SettingsModel settingsController = ref.watch(settingsModelProvider);
    bool darkMode = settingsController.settings.darkMode;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final ThemeData theme = darkMode ? Themes.dark : Themes.light;
    if (errorOccurred) {
      return MaterialApp(
        theme: theme,
        home: Scaffold(
          backgroundColor: theme.colorScheme.secondary,
          appBar: AppBar(
            backgroundColor: theme.colorScheme.primary,
            title: TitleWithButton(
              title: LocaleKeys.general_error_handler_title.tr(),
              icon: Icons.arrow_back_ios,
              onButtonClick: () {
                setState(() {
                  errorOccurred = false;
                });
              },
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025, horizontal: screenWidth * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      AspectRatio(
                        aspectRatio: 2,
                        child: ImageWithLoading(
                          imagePath: 'assets/images/icon_${darkMode ? 'dark' : 'light'}_free.png'
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      Text(
                        LocaleKeys.general_error_handler_apology.tr(),
                        style: TextStyle(
                          fontSize: theme.textTheme.bodyMedium!.fontSize,
                          color: theme.colorScheme.onSecondary
                        ),
                      ),
                      Text(
                        LocaleKeys.general_error_handler_announce.tr(),
                        style: TextStyle(
                          color: theme.colorScheme.onSecondary
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: theme.colorScheme.onSecondary
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      NavigationButton(
                        buttonText: LocaleKeys.general_error_handler_try_again.tr(),
                        buttonIcon: Icons.refresh_outlined,
                        onPressed: () {
                          setState(() {
                            errorOccurred = false;
                          });
                        },
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      );
    }
    return widget.child;
  }
}