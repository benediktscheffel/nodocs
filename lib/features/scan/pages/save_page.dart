import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nodocs/features/filesystem/widgets/collection_dropdown.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/implementation/save_provider.dart';
import 'package:nodocs/features/scan/controller/save_controller.dart';
import 'package:nodocs/features/scan/model/save_model.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';
import 'package:nodocs/features/scan/widgets/scan_carousel.dart';
import 'package:nodocs/features/scan/widgets/scan_ocr_loading_dialog.dart';
import 'package:nodocs/features/scan/widgets/scan_title_input.dart';
import 'package:nodocs/features/tags/widgets/tag_dropdown.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/dropdown_with_label.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';

class SavePage extends ConsumerWidget {
  const SavePage({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    SaveController controller = ref.read(saveControllerProvider);
    SaveModel model = ref.watch(saveModelProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ScanTitleInput(),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: DropdownWithLabel(
                    dropdown: TagDropdown(
                      tags: model.tags,
                    ),
                    label: "Select Tags",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: DropdownWithLabel(
                    dropdown: CollectionDropdown(),
                    label: "Select Folder",
                  ),
                ),
                const SizedBox(height: 5,),
                ScanCarousel(onPageSelect: (final String path) {
                  controller.setSelectedImagePath(path);
                },),
                const SizedBox(height: 5,),
                ScanActionButtonContainer(
                  buttons: <Widget>[
                    ScanActionButton(
                      buttonIcon: Icons.crop_free_outlined,
                      buttonText: 'Crop Again',
                      onPressed: () {
                        controller.goToPage(
                          Uri(
                            path: NavigationServiceRoutes.crop,
                            queryParameters: <String, String>{
                              'path': model.selectedImagePath
                            }
                          )
                        );
                      },
                    ),
                    ScanActionButton(
                      buttonIcon: Icons.flip_camera_ios_outlined,
                      buttonText: 'Retake',
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (final BuildContext context) =>
                            ConfirmationDialog(
                                onConfirm: () {
                                  // TODO delete current selected page
                                  controller.goToPage(
                                      Uri(path: NavigationServiceRoutes.scan));
                                },
                                onCancel: () {
                                  controller.goBack();
                                },
                                header: 'Retake this scan?',
                                notificationText:
                                    'Are you sure you want to retake the scan of the current page without saving?'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'Cancel',
            buttonIcon: Icons.cancel_outlined,
            onPressed: () => showDialog<String>(
              context: context,
              builder: (final BuildContext context) => ConfirmationDialog(
                  onConfirm: () {
                    controller.goToPage(
                        Uri(path: NavigationServiceRoutes.home));
                  },
                  onCancel: () {
                    controller.goBack();
                  },
                  header: 'Cancel this scan?',
                  notificationText:
                      'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'),
            ),
          ),
          NavigationButton(
              buttonText: 'Save',
              buttonIcon: Icons.save_outlined,
              onPressed: () async {
                // TODO Write Tags to Database and Save PDF in selected folder
                controller.savePDF(
                    (await controller.createPDF(model.imagePaths)).save());
              }
          ),
          NavigationButton(
            buttonText: 'OCR & Save',
            buttonIcon: Icons.document_scanner_outlined,
            onPressed: () {
              // TODO Write Tags to Database and Save PDF in selected folder
              showDialog<String>(
                context: context,
                builder: (final BuildContext context) {
                  controller.handleDocumentOCR(context, model.imagePaths);
                  return const ScanOcrLoadingDialog();
                },
              );
              // await captureAndCreatePDF(XFile(selectedImagePath));
            }
          ),
        ],
      ),
    );
  }
}