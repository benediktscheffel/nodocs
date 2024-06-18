import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/controller/implementation/home_providers.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';
import 'package:nodocs/features/filesystem/widgets/collection_container.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/features/filesystem/widgets/collection_tile.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/widgets/search_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    HomeController controller = ref.read(homeControllerProvider);
    HomeModel model = ref.watch(homeModelProvider);
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
                children:
                    _buildCollectionTiles(model.collectionNodes, controller)),
            const SearchBox(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'New Collection',
            buttonIcon: Icons.add_outlined,
            onPressed: () => _showCreateCollectionModal(
                context, controller.createCollection()),
          ),
          NavigationButton(
              buttonText: 'Scan Document',
              buttonIcon: Icons.camera_alt_outlined,
              onPressed: () {
                controller.goToPage(Uri(path: NavigationServiceRoutes.scan));
              }),
          NavigationButton(
              buttonText: 'Settings',
              buttonIcon: Icons.settings_outlined,
              onPressed: () {
                controller
                    .goToPage(Uri(path: NavigationServiceRoutes.settings));
              }),
        ],
      ),
    );
  }

  List<CollectionTile> _buildCollectionTiles(
      final List<CollectionNode> nodes, final HomeController controller) {
    return nodes
        .map((final CollectionNode node) => CollectionTile(
              title: node.displayName,
              leading: node.path.endsWith('.pdf')
                  ? Icons.picture_as_pdf_outlined
                  : Icons.folder_outlined,
              path: node.path,
              onDelete: controller.deleteCollectionOrFile,
              onTapPdf: () => controller.goToPage(Uri(
                  path: NavigationServiceRoutes.pdfViewer,
                  queryParameters: <String, String>{'path': node.path})),
              children: _buildCollectionTiles(node.children, controller),
            ))
        .toList();
  }

  void _showCreateCollectionModal(
      final BuildContext context, final Function(String) onSave) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) =>
            CollectionCreateDialog(onSave: onSave));
  }
}
