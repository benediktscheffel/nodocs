import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/filesystem/controller/home_contoller.dart';
import 'package:nodocs/features/filesystem/controller/implementation/home_providers.dart';
import 'package:nodocs/features/filesystem/model/home_model/home_model.dart';
import 'package:nodocs/features/filesystem/widgets/collection_container.dart';
import 'package:nodocs/features/filesystem/widgets/collection_create_dialog.dart';
import 'package:nodocs/features/filesystem/widgets/collection_rename_dialog.dart';
import 'package:nodocs/features/filesystem/widgets/collection_tile.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/widgets/collection_tile_dialog.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/features/search/widgets/search_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final HomeController controller = ref.read(homeControllerProvider);
    final HomeModel model = ref.watch(homeModelProvider);

    WidgetsBinding.instance
        .addPostFrameCallback((final _) => controller.updateState());
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: Text("NoDocs",
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 17,
            )),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder:
            (final BuildContext context, final BoxConstraints constraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CollectionContainer(
                      children: _buildCollectionTiles(
                          model.collectionNodes, controller),
                    ),
                    const SearchBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: LocaleKeys.home_new_collection.tr(),
            buttonIcon: Icons.add_outlined,
            onPressed: () => _showCreateCollectionModal(
                context, controller.createCollection(), controller.goBack),
          ),
          NavigationButton(
              buttonText: LocaleKeys.home_scan_document.tr(),
              buttonIcon: Icons.camera_alt_outlined,
              onPressed: () {
                controller.goToPage(Uri(
                    path: NavigationServiceRoutes.scan,
                    queryParameters: <String, List<String>>{
                      'path': <String>[],
                    }));
              }),
          NavigationButton(
              buttonText: LocaleKeys.home_settings.tr(),
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
        .map(
          (final CollectionNode node) => CollectionTile(
            title: node.displayName,
            isPdf: node.path.endsWith('.pdf'),
            onTapPdf: () => controller.goToPage(Uri(
                path: NavigationServiceRoutes.pdfViewer,
                queryParameters: <String, String>{'path': node.path})),
            contextMenu: CollectionTileDialog(
              contextPath: node.path,
              onShare: () => controller.shareFile(node.path, node.displayName),
              onAdd: () {
                controller.addFile(node.path);
                controller.goBack();
              },
              deleteDialog: ConfirmationDialog(
                onConfirm: () {
                  controller.deleteCollectionOrFile(node.path);
                  controller.goBackTwice();
                },
                onCancel: () => controller.goBackTwice,
                header: LocaleKeys.home_collection_tile_delete_dialog_header.tr(),
                notificationText: '${LocaleKeys.home_collection_tile_delete_dialog_header.tr()}\'${node.displayName}\'?',
              ),
              renameDialog: CollectionRenameDialog(
                onSave: controller.renameCollectionOrFile(node.path),
                goBack: controller.goBackTwice,
                initialText: node.displayName,
              ),
            ),
            children: _buildCollectionTiles(node.children, controller),
          ),
        )
        .toList();
  }

  void _showCreateCollectionModal(final BuildContext context,
      final Function(String) onSave, final VoidCallback goBack) {
    showDialog<String>(
        context: context,
        builder: (final BuildContext context) => CollectionCreateDialog(
              onSave: onSave,
              goBack: goBack,
            ));
  }
}
