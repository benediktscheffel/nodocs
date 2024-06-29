import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/crop_controller.dart';
import 'package:nodocs/features/scan/controller/implementation/crop_provider.dart';
import 'package:nodocs/features/scan/widgets/scan_crop.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';

import 'package:nodocs/widgets/title_with_button.dart';

class CropPage extends ConsumerWidget {
  final List<String> imagePaths;
  const CropPage({super.key, required this.imagePaths});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final CropController controller = ref.watch(cropControllerProvider);
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
            builder: (final BuildContext context) =>
              ConfirmationDialog(
                onConfirm: (){
                  GoRouter.of(context).go(NavigationServiceRoutes.home);
                },
                onCancel: (){
                  Navigator.pop(context);
                },
                header: 'Discard this scan?',
                notificationText: 'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'
              ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ScanCrop(imagePaths: imagePaths),
        ],
      ),
      bottomNavigationBar: NavigationBox(buttons: <Widget>[
        NavigationButton(
          buttonText: 'Retake Photo',
          buttonIcon: Icons.flip_camera_ios_outlined,
          onPressed: () => showDialog<String>(
            context: context,
            builder: (final BuildContext context) =>
              ConfirmationDialog(
                onConfirm: (){
                  controller.removeLastImageFromImagePaths();
                  controller.goToPage(Uri(
                    path: NavigationServiceRoutes.scan,
                    queryParameters: <String, List<String>>{
                      'path': controller.getImagePaths(),
                    }));
                  controller.clear();
                },
                onCancel: (){
                  controller.goBack();
                },
                header: 'Retake this scan?',
                notificationText: 'Are you sure you want to retake the scan of the current page without saving?',
              ),
          ),
        ),
        NavigationButton(
          buttonText: 'Keep Scanning',
          buttonIcon: Icons.arrow_forward_outlined,
          onPressed: () {
            controller.goToPage(Uri(
                path: NavigationServiceRoutes.scan,
                queryParameters: <String, List<String>>{
                  'path': controller.getImagePaths(),
                }));
            controller.clear();
          },
        ),
        NavigationButton(
          buttonText: 'Save Document',
          buttonIcon: Icons.save_outlined,
          onPressed: () {
            controller.goToPage(Uri(
                path: NavigationServiceRoutes.save,
                queryParameters: <String, List<String>>{
                  'path': controller.getImagePaths(),
                }));
            controller.clear();
          },
        ),
      ]),
    );
  }
}