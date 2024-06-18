import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/widgets/scan_crop.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';

import 'package:nodocs/widgets/title_with_button.dart';

class CropPage extends StatelessWidget {
  final String path;

  const CropPage({super.key, required this.path});

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.primary,
        title: TitleWithButton(
          title: "Crop Scan",
          icon: Icons.home_outlined,
          onButtonClick: () => showDialog<String>(
            context: context,
            builder: (final BuildContext context) => ConfirmationDialog(
                onConfirm: () {},
                onCancel: () {},
                header: 'Discard this scan?',
                notificationText:
                    'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ScanCrop(
            path: path,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBox(buttons: <Widget>[
        NavigationButton(
          buttonText: 'Retake Photo',
          buttonIcon: Icons.flip_camera_ios_outlined,
          onPressed: () => showDialog<String>(
            context: context,
            builder: (final BuildContext context) => ConfirmationDialog(
              onConfirm: () {
                // TODO delete photo
                GoRouter.of(context).go(NavigationServiceRoutes.pdfViewer);
              },
              onCancel: () {},
              header: 'Retake this scan?',
              notificationText:
                  'Are you sure you want to retake the scan of the current page without saving?',
            ),
          ),
        ),
        NavigationButton(
          buttonText: 'Keep Scanning',
          buttonIcon: Icons.arrow_forward_outlined,
          onPressed: () {
            // TODO Save image under documents path
            GoRouter.of(context).go(NavigationServiceRoutes.scan);
          },
        ),
        NavigationButton(
          buttonText: 'Save Document',
          buttonIcon: Icons.save_outlined,
          onPressed: () {
            // TODO Forward image paths to SavePage
            GoRouter.of(context).go(NavigationServiceRoutes.save);
          },
        ),
      ]),
    );
  }
}
