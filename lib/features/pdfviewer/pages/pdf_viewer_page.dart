import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/pdfviewer/controller/implementation/pdf_viewer_providers.dart';
import 'package:nodocs/features/pdfviewer/controller/pdf_viewer_controller.dart';
import 'package:nodocs/features/pdfviewer/model/pdf_viewer_model.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_search_toolbar.dart';
import 'package:nodocs/features/pdfviewer/widgets/pdf_viewer.dart';
import 'package:nodocs/features/tags/widgets/tag_chip_container.dart';
import 'package:nodocs/features/tags/widgets/tag_dialog.dart';
import 'package:nodocs/gen/locale_keys.g.dart';

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
              iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
              automaticallyImplyLeading: false,
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
                  goBack: () => controller.goBack(),
                ),
              ),
              backgroundColor: theme.colorScheme.primary,
            )
          : AppBar(
              iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
              title: Text(
                path.split('/').last.replaceAll('.pdf', ''),
                style: TextStyle(color: theme.colorScheme.onPrimary),
              ),
              backgroundColor: theme.colorScheme.primary,
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
                    child: Text(
                      LocaleKeys.pdf_viewer_no_result.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: theme.textTheme.bodyMedium!.fontSize,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Builder(
        builder: (final BuildContext context) {
          return FloatingActionButton(
            elevation: 12,
            onPressed: () => _showContextMenu(context, controller, model),
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.menu),
          );
        },
      ),
    );
  }

  void _showContextMenu(final BuildContext context,
      final PdfViewerController controller, final PdfViewerModel model) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset position =
        button.localToGlobal(Offset.zero, ancestor: overlay);
    final Size buttonSize = button.size;
    await showMenu(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy - 2.3 * buttonSize.height,
        overlay.size.width - (position.dx + buttonSize.width),
        overlay.size.height - position.dy,
      ),
      items: <PopupMenuItem<ListTile>>[
        PopupMenuItem<ListTile>(
          child: ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: Text(LocaleKeys.pdf_viewer_navigation_edit_tags.tr()),
            onTap: () {
              controller.goBack();
              showDialog<String>(
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
              );
            },
          ),
        ),
        PopupMenuItem<ListTile>(
          child: ListTile(
            leading: const Icon(Icons.search),
            title: Text(LocaleKeys.pdf_viewer_navigation_search.tr()),
            onTap: () {
              controller.goBack();
              controller.toggleScrollHead(false);
              controller.toggleToolbar(true);
              controller.ensureHistoryEntry(context);
            },
          ),
        ),
      ],
    );
  }
}
