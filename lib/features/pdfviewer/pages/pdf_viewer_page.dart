import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/pdfviewer/controller/implementation/pdf_viewer_providers.dart';
import 'package:nodocs/features/pdfviewer/controller/pdf_viewer_controller.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_search_toolbar.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_viewer.dart';
import 'package:nodocs/features/tags/widgets/tag_chip_container.dart';
import 'package:nodocs/features/tags/widgets/tag_dialog.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';

class PdfViewerPage extends ConsumerWidget {
  final String path;

  const PdfViewerPage({
    super.key,
    required this.path,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final PdfViewerController controller =
        ref.read(pdfViewerControllerProvider);
    final PdfViewerModel model = ref.watch(pdfViewerModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      controller.updateTags(controller.loadTags(path));
    });
    controller.initSearchKey();
    return Scaffold(
      appBar: model.showToolbar
          ? AppBar(
              flexibleSpace: SafeArea(
                child: PdfSearchToolbar(
                  key: controller.searchKey,
                  showTooltip: true,
                  controller: controller.pdfViewerController,
                  onTap: (final Object toolbarItem) async {
                    if (toolbarItem.toString() == 'Cancel Search') {
                      controller.toggleToolbar(false);
                      controller.toggleScrollHead(true);
                      controller.goBack();
                    }
                    if (toolbarItem.toString() == 'noResultFound') {
                      controller.showToast();
                    }
                  },
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: theme.colorScheme.secondary,
            )
          : AppBar(
              title: Text(
                path.split('/').last.replaceAll('.pdf', ''),
                style: TextStyle(color: theme.colorScheme.onSecondary),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: theme.colorScheme.secondary,
            ),
      body: Stack(
        children: <Widget>[
          PdfViewer(
            path: path,
            pdfViewerController: controller.pdfViewerController,
            showScrollHead: model.showScrollHead,
          ),
          Visibility(
            visible: controller.searchKey.currentState?.showToast ?? false,
            child: Align(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15, top: 7, right: 15, bottom: 7),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: const Text(
                      'No result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'Edit Tags',
            buttonIcon: Icons.edit_outlined,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (final BuildContext context) => TagDialog(
                saveTags: controller.syncTagsWithDatabase(path),
                goBack: controller.closeDialog,
                tagChipContainer: TagChipContainer(
                  tagData: model.tags
                      .map((final Tag tag) => (tag.name, tag.selected))
                      .toList(),
                ),
              ),
            ),
          ),
          NavigationButton(
            buttonText: 'Home',
            buttonIcon: Icons.home_outlined,
            onPressed: () {
              controller.disposeSearchKey();
              controller.goBack();
            },
          ),
          NavigationButton(
              buttonText: 'Search',
              buttonIcon: Icons.search,
              onPressed: () {
                controller.toggleScrollHead(false);
                controller.toggleToolbar(true);
                controller.ensureHistoryEntry(context);
              }),
        ],
      ),
    );
  }
}
