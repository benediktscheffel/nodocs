import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/filesystem/widgets/collection_dropdown.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';
import 'package:nodocs/features/scan/widgets/scan_carousel.dart';
import 'package:nodocs/features/scan/widgets/scan_title_input.dart';
import 'package:nodocs/features/tags/widgets/tag_dropdown.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/dropdown_with_label.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<StatefulWidget> createState() => SavePageState();
}

class SavePageState extends State<SavePage> {
  String selectedImagePath = "";

  @override
  Widget build(final BuildContext context) {
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: DropdownWithLabel(
                    dropdown: TagDropdown(
                      tags: <String>{
                        "Tag1",
                        "Tag2",
                        "Tag3",
                        "Tag4",
                        "Tag5",
                        "Tag6",
                        "Tag7",
                        "Tag8",
                        "Tag9",
                        "Tag10"
                      },
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
                const SizedBox(
                  height: 5,
                ),
                ScanCarousel(
                  onPageSelect: (final String path) {
                    selectedImagePath = path;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                ScanActionButtonContainer(
                  buttons: <Widget>[
                    ScanActionButton(
                      buttonIcon: Icons.crop_free_outlined,
                      buttonText: 'Crop Again',
                      onPressed: () {
                        GoRouter.of(context).push(Uri(
                            path: NavigationServiceRoutes.crop,
                            queryParameters: <String, String>{
                              'path': selectedImagePath
                            }).toString());
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
                                  GoRouter.of(context)
                                      .push(NavigationServiceRoutes.scan);
                                },
                                onCancel: () {
                                  GoRouter.of(context).pop();
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
                    GoRouter.of(context).go(NavigationServiceRoutes.home);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  header: 'Cancel this scan?',
                  notificationText:
                      'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'),
            ),
          ),
          NavigationButton(
              buttonText: 'Save & Exit',
              buttonIcon: Icons.save_outlined,
              onPressed: () {
                // TODO OCR, Save Document and write Tags to Database
                GoRouter.of(context).go(NavigationServiceRoutes.home);
              }),
        ],
      ),
    );
  }
}
