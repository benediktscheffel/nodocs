import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/widgets/collection_container.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          "NoDocs",
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 17,
          )
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CollectionContainer(),
            SearchBox(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'New Collection',
            buttonIcon: Icons.add_outlined,
            onPressed: () => showDialog<String>(
                context: context,
                builder: (final BuildContext context) =>
                const CollectionCreateDialog()
            ),
          ),
          NavigationButton(
              buttonText: 'Scan Document',
              buttonIcon: Icons.camera_alt_outlined,
              onPressed: () {
                const ScanPageRoute().go(context);
              }
          ),
          NavigationButton(
              buttonText: 'Settings',
              buttonIcon: Icons.settings_outlined,
              onPressed: () {
                const SettingsPageRoute().go(context);
              }
          ),
        ],
      ),
    );
  }
}