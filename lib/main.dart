import 'package:flutter/material.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const bool darkMode = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: darkMode ? const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF111122),
          onPrimary: Colors.white,
          secondary: Color(0xFF061A40),
          onSecondary: Colors.white,
          tertiary: Color(0xFF006DAA),
          onTertiary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFF111122),
          onSurface: Colors.white,
        ) : const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFB9D6F2),
          onPrimary: Colors.black,
          secondary: Color(0xFF0353A4),
          onSecondary: Colors.white,
          tertiary: Colors.white,
          onTertiary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFFB9D6F2),
          onSurface: Colors.black,
        ),
        buttonTheme: const ButtonThemeData(
          height: 32,
          minWidth: 64,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NoDocs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: theme.colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 17)),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            NavigationBox(buttons: [
                NavigationButton(buttonText: 'New Collection', buttonIcon: Icons.add_outlined, onPressed: () {}),
                NavigationButton(buttonText: 'Scan Document', buttonIcon: Icons.camera_alt_outlined, onPressed: () {}),
                NavigationButton(buttonText: 'Settings', buttonIcon: Icons.settings_outlined, onPressed: () {}),
              ]
            )
          ],
        ),
      ),
    );
  }
}
