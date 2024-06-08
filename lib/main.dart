import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:nodocs/features/presentation/pages/widgets_page.dart';

import 'go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<CameraDescription> cameras =
      await availableCameras(); // sadly this must be done this early to prevent errors
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    const bool darkMode = false;
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: darkMode
            ? const ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0xFF111122),
                onPrimary: Colors.white,
                onPrimaryContainer: Color(0xFF0353A4),
                secondary: Color(0xFF061A40),
                onSecondary: Colors.white,
                tertiary: Color(0xFF006DAA),
                onTertiary: Colors.white,
                error: Colors.red,
                onError: Colors.white,
                surface: Color(0xFF111122),
                onSurface: Colors.white,
                tertiaryContainer: Colors.white,
                onTertiaryContainer: Colors.black,
                tertiaryFixed: Color(0xFFECE7E7),
                onTertiaryFixed: Color(0xFFCAC4D0),
              )
            : const ColorScheme(
                brightness: Brightness.light,
                primary: Color(0xFFB9D6F2),
                onPrimary: Colors.black,
                onPrimaryContainer: Color(0xFF0353A4),
                secondary: Color(0xFF0353A4),
                onSecondary: Colors.white,
                tertiary: Colors.white,
                onTertiary: Colors.black,
                error: Colors.red,
                onError: Colors.white,
                surface: Color(0xFFB9D6F2),
                onSurface: Colors.black,
                tertiaryContainer: Colors.white,
                onTertiaryContainer: Colors.black,
                tertiaryFixed: Color(0xFFECE7E7),
                onTertiaryFixed: Color(0xFFCAC4D0),
              ),
        buttonTheme: const ButtonThemeData(
          height: 32,
          minWidth: 64,
        ),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const MyHomePage({super.key, required this.title, required this.cameras});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(widget.title,
            style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 17)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                          onPressed: () {
                            const HomeRoute().go(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.secondary,
                            foregroundColor: theme.colorScheme.onSecondary,
                          ),
                          child: const Text('Widgets')),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
