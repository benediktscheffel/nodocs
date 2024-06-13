import 'package:flutter/material.dart';
import 'package:nodocs/features/filesystem/controller/file_system_contoller/file_system_contoller.dart';
import 'package:nodocs/features/filesystem/controller/file_system_contoller/implementation/file_system_controller_impl.dart';
import 'package:nodocs/features/filesystem/model/collection_node/collection_node.dart';
import 'package:nodocs/features/filesystem/widgets/collection_container.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/features/filesystem/widgets/collection_tile.dart';
import 'package:nodocs/go_router.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/widgets/search_bar.dart';

import '../config/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    FileSystemController controller = getIt<FileSystemController>();

    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        title: Text("NoDocs",
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 17,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CollectionContainer(
                children: controller
                    .build()
                    .map((final CollectionNode node) =>
                        node.path.endsWith('.pdf')
                            ? CollectionTile(
                                title: node.displayName,
                                leading: Icons.picture_as_pdf_outlined,
                                path: node.path,
                                nodes: node.children,
                              )
                            : CollectionTile(
                                title: node.displayName,
                                leading: Icons.folder_outlined,
                                path: node.path,
                                nodes: node.children,
                              ))
                    .toList()),
            const SearchBox(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'New Collection',
            buttonIcon: Icons.add_outlined,
            onPressed: () => controller.showCreateCollectionModal(context),
          ),
          NavigationButton(
              buttonText: 'Scan Document',
              buttonIcon: Icons.camera_alt_outlined,
              onPressed: () {
                const ScanPageRoute().go(context);
              }),
          NavigationButton(
              buttonText: 'Settings',
              buttonIcon: Icons.settings_outlined,
              onPressed: () {
                const SettingsPageRoute().go(context);
              }),
        ],
      ),
    );
  }
}
